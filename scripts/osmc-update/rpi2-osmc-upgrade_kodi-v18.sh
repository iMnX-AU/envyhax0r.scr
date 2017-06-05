#!/bin/bash

if [[ $UID == "0" ]]; then
  if [[ $USERNAME == "root" ]]; then
    osmcVERSION="17.8-035"
    echo 'deb http://download.osmc.tv/dev/gmc-18 ./' > /etc/apt/sources.list.d/osmc-repository-kodi-v180-rpi.list
    apt-get update
    # apt-get install rbp1-mediacenter-osmc
    # apt-get install rbp1-mediacenter-osmc=${osmcVERSION}
    apt-get install -yq rbp2-mediacenter-osmc
    # apt-get install -yq rbp2-mediacenter-osmc=${osmcVERSION}
    apt-get dist-upgrade -yq
    exit 0
  else
    printf "[$(basename $0)]: elevated permissions required to use this tool.\n"
    exit 1
  fi
else
  printf "[$(basename $0)]: elevated permissions required to use this tool.\n"
  exit 1
fi
