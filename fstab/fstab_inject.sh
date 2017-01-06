#!/bin/bash

smb_credentials="/root/credentials.smb"
apt-get -y install samba cifs-utils


if [[ ${USER} == "root" && ${UID} == "0" ]]; then
  sudo=""
else
  sudo="/usr/bin/sudo"
fi

# setup credentials file.
read -p "smb_username: " smb_user
read -p "smb_password: " smb_pass
read -p "smb_domain: " smb_domain

rm -r "${smb_credentials}" > /dev/null &
touch "${smb_credentials}"
if [[ $smb_user == "" ]]; then
  printf "[fstab_inject]: can't create samba credentials file without username.\n"
  printf "[fstab_inject]: script cannot continue.\n"
  exit 1
else
  printf "[fstab_inject]: setting username...\n"
  echo "user=${smb_user}" >> ${smb_credentials}
fi

if [[ $smb_pass == "" ]]; then
  printf "[fstab_inject]: can't create samba credentials file without password.\n"
  printf "[fstab_inject]: script cannot continue.\n"
  exit 1
else
  printf "[fstab_inject]: setting password...\n"
  echo "pass=${smb_pass}" >> ${smb_credentials}
fi

if [[ $smb_domain == "" ]]; then
  printf "[fstab_inject]: no domain provided, using the default value \'WORKGROUP\'.\n"
  ${sudo} echo "domain=WORKGROUP" >> ${smb_credentials}
  exit 1
else
  printf "[fstab_inject]: setting domain...\n"
  echo "domain=${smb_domain}" >> ${smb_credentials}
fi

${sudo} chmod 0700 ${smb_credentials}
unset smb_user smb_pass smb_domain

while read -r line; do
  temp0=${line}
  test0=`echo ${line} | grep "#cipher#"`
  if [[ $test0 ]]; then
    scrapdata="${line}"
    unset scrapdata
  else
    echo ${line} >> '/tmp/.fstab.tmp'
  fi
done < <(cat /etc/fstab)
${sudo} mv '/tmp/.fstab.tmp' '/etc/fstab'

rm -r /tmp/.fstab.tmp.cipher > /dev/null &
touch /tmp/.fstab.tmp.cipher
while read -r line; do
  temp0="${line}"
  smb_share=`echo "${temp0}" | cut -d"|" -f1`
  smb_mountpoint=`echo "${temp0}" | cut -d"|" -f2`
  # mkdir -p "${smb_mountpoint}"
  ${sudo} echo "${smb_share} ${smb_mountpoint} cifs credentials=${smb_credentials},uid=1000,gid=1000 0 0 #cipher#" >> /tmp/.fstab.tmp.cipher
done < <(cat "./fstab_entries.data")

printf "[fstab_inject]: adding these entries to fstab...\n\n"
cat /tmp/.fstab.tmp.cipher

${sudo} echo "" >> "/etc/fstab"
${sudo} echo "# cipher's shares (#cipher#)." >> "/etc/fstab"
${sudo} cat "/tmp/.fstab.tmp.cipher" >> "/etc/fstab"

printf "[fstab_inject]: done!\n"
