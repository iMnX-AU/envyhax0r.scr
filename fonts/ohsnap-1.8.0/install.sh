#!/bin/bash

curDir="$(pwd)"
fontDir="/usr/share/fonts/X11/misc"
srcDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Use sudo if user isn't already "root".

if [[ ${USER} == "root" ]]; then
  if [[ ${UID} == "0" ]]; then
    sudo=""
  else
    sudo="/usr/bin/sudo"
  fi
fi

cd "${srcDir}"

test0="`ls -1 *.pcf`"
test1="`ls -1 *.psfu`"

if [[ $test0 ]]; then
	${sudo} gzip ${srcDir}/*.pcf
fi

if [[ $test1 ]]; then
	${sudo} gzip ${srcDir}/*.psfu
fi

${sudo} mkdir -p ${fontDir}
${sudo} cp 50-ohsnap-enable.conf /etc/fonts/conf.d/50-ohsnap-enable.conf
${sudo} cp ${srcDir}/*.pcf.gz ${fontDir}
${sudo} cp ${srcDir}/*.psfu.gz ${fontDir}
${sudo} gzip -d *.gz

${sudo} dpkg-reconfigure fontconfig
cd ${curDir}
