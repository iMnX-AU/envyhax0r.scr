#!/bin/bash

read -p "which distro of linux are you using? [eg: ubuntu|debian]: " osDistro
read -p "which release of this distro? [eg: lenny/wheezy/xenial/yakkety]: " distRelease

if [[ ${osDistro} == "debian" ]]; then
echo "deb http://mirror.internode.on.net/pub/debian/ ${distRelease} main contrib non-free
deb-src http://mirror.internode.on.net/pub/debian/ ${distRelease} main contrib non-free
deb http://mirror.internode.on.net/pub/debian/ ${distRelease}-updates main contrib non-free
deb-src http://mirror.internode.on.net/pub/debian/ ${distRelease}-updates main contrib non-free
deb http://mirror.internode.on.net/pub/debian/ ${distRelease}-proposed-updates main contrib non-free
deb-src http://mirror.internode.on.net/pub/debian/ ${distRelease}-proposed-updates main contrib non-free
deb http://mirror.internode.on.net/pub/debian/ ${distRelease}-backports main contrib non-free
deb-src http://mirror.internode.on.net/pub/debian/ ${distRelease}-backports main contrib non-free" > /etc/apt/sources.list
elif [[ ${osDistro} == "ubuntu" ]]; then
echo "deb http://mirror.internode.on.net/pub/ubuntu/ubuntu/ ${distRelease} main restricted universe multiverse
deb-src http://mirror.internode.on.net/pub/ubuntu/ubuntu/ ${distRelease} main restricted universe multiverse
deb http://mirror.internode.on.net/pub/ubuntu/ubuntu/ ${distRelease}-updates main restricted universe multiverse
deb-src http://mirror.internode.on.net/pub/ubuntu/ubuntu/ ${distRelease}-updates main restricted universe multiverse
deb http://mirror.internode.on.net/pub/ubuntu/ubuntu/ ${distRelease}-backports main restricted universe multiverse
deb-src http://mirror.internode.on.net/pub/ubuntu/ubuntu/ ${distRelease}-backports main restricted universe multiverse
deb http://mirror.internode.on.net/pub/ubuntu/ubuntu/ ${distRelease}-security main restricted universe multiverse
deb-src http://mirror.internode.on.net/pub/ubuntu/ubuntu/ ${distRelease}-security main restricted universe multiverse" > /etc/apt/sources.list
else
 true
fi

apt-get update

apt-get -y install openssh-server samba cifs-utils psmisc dnsutils pv dialog build-essential automake autoconf autotools-dev \
git subversion mercurial cvs libtool intltool bison flex nasm yasm mc mc-data irssi irssi-scripts iptraf sudo doxygen apt-utils \
software-properties-common aptitude  cmake qt5-default perl-base curl perl python python-pip python3 python3-pip python-serial \
python3-serial vlc ffmpeg *-6-multilib intel-microcode amd64-microcode 
