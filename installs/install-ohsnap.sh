#!/usr/bin/sudo /bin/bash

printf "Checking prerequisites...\n"
apt-get -yq install fontconfig
printf "\n"
sleep 0.5

printf "Getting files...\n"
git clone -b master --depth=1 http://ubu-server.homenet.h0ax.net/imnx/font-ohsnap
printf "\n"
sleep 0.5

printf "Installing font: OhSnap v1.8.0...\n"
cd font-ohsnap
./install.sh
cd ..
printf "\n"
sleep 0.5

printf "Done installing \'OhSnap v1.8.0\'.\n\n"