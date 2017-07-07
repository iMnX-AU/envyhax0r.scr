#!/usr/bin/sudo /bin/bash

devPKGS="build-essential automake autoconf autotools-dev autogen autopoint autoproject cmake libtool intltool bison flex nasm yasm \
byacc doxygen texi2html texinfo pandoc openjdk-8-jdk-headless git cvs mercurial subversion qt5-default *-6-multilib libncurses5-dev \
libncursesw5-dev python python3 ruby gen nodejs npm python-dev python3-dev gawk python-serial python3-serial perl"

otherPKGS="dialog pv dd gdisk testdisk perl-base curl wget sudo nano aptitude openssh-server samba cifs-utils intel-microcode \
amd64-microcode zenity mc mc-data irssi irssi-scripts dnsutils net-tools apt-utils psmisc"

mediaPKGS="ffmpeg kodi vlc* youtube-dl"




if [[ ! ${cmdline2} ]]; then
  exit 1
else
  cd /usr/src
  git clone -b master --depth=1 http://github.com/imnx/envyhax0r.scr envyhax0r-scr/
  cd envyhax0r-scr/fonts/ohsnap-installer
  ./install.sh
  cd ../..
  cd fstab
  ./fstab_inject.sh
  cd ..
  exit 0
fi
