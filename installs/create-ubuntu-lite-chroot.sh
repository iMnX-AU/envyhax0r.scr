#!/usr/bin/sudo /bin/bash
echo "deb http://mirror.internode.on.net/pub/ubuntu/ubuntu/ zesty main restricted universe multiverse
deb-src http://mirror.internode.on.net/pub/ubuntu/ubuntu/ zesty main restricted universe multiverse
deb http://mirror.internode.on.net/pub/ubuntu/ubuntu/ zesty-security main restricted universe multiverse
deb-src http://mirror.internode.on.net/pub/ubuntu/ubuntu/ zesty-security main restricted universe multiverse
deb http://mirror.internode.on.net/pub/ubuntu/ubuntu/ zesty-updates main restricted universe multiverse
deb-src http://mirror.internode.on.net/pub/ubuntu/ubuntu/ zesty-updates main restricted universe multiverse" > /etc/apt/sources.list
sudo apt-get update
sudo apt-get install xorg xterm lightdm unity ubuntu-desktop menu firefox gksu synaptic --no-install-recommends
sudo apt-get install xorg xterm lightdm menu ubiquity gksu synaptic --no-install-recommends
sudo apt-get install gnome-session gnome-panel metacity gnome-terminal --no-install-recommends
echo "sudo /etc/init.d/lightdm start
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:gnome3-team/gnome3
sudo apt-get update
sudo apt-get install gnome-shell --no-install-recommends
sudo apt-get upgrade" > /root/startup.sh
