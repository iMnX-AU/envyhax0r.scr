#!/bin/bash

# Use sudo if user isn't already "root".

if [[ ${USER} == "root" ]]; then
  if [[ ${UID} == "0" ]]; then
    sudo=""
  else
    sudo="/usr/bin/sudo"
  fi
fi

${sudo} mkdir -p /usr/share/fonts/X11/misc
${sudo} cp 50-ohsnap-enable.conf /etc/fonts/conf.d/50-ohsnap-enable.conf
${sudo} cp *.pcf /usr/share/fonts/X11/misc
${sudo} cp *.psfu /usr/share/fonts/X11/misc
${sudo} dpkg-reconfigure fontconfig

