#!/bin/bash
if [[ $UID == "0" ]]; then
  if [[ $USERNAME == "root" ]]; then
    osmcVer="17.8-035"
    echo 'deb http://download.osmc.tv/dev/gmc-18 ./' > /etc/apt/sources.list
    apt-get update
    apt-get install rbp1-mediacenter-osmc=${osmcVer}
    # apt-get install rbp1-mediacenter-osmc=${osmcVer}
    # apt-get install rbp1-mediacenter-osmc
    # apt-get install rbp2-mediacenter-osmc
    apt-get dist-upgrade
	exit 0
  else
    printf "[$(basename $0)]: need to be logged in as root.\n"
	exit 1
  fi
else
  printf "[$(basename $0)]: need to be logged in as root.\n"
  exit 1
fi  
