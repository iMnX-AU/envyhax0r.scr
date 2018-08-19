#!/usr/bin/sudo /bin/bash
apt -y update
apt -y install apt-utils
apt -y install iputils-* net-tools psmisc sudo nano perl-base curl cifs-utils openssh-server samba dnsutils python python-pip \
tilda dialog zenity libncurses5-dev libncursesw5-dev
apt -y install finch libpurple-dev libjson-glib-dev
apt -y install locales-all tzdata console-setup keyboard-configuration
apt -y install build-essential automake autoconf autotools-dev autoproject autogen autopoint llvm gccgo gfortran maven \
ninja-build cmake qt5-default qt5-qmake bison flex nasm yasm byacc libtool intltool texinfo texi2html doxygen pandoc git cvs \
mercurial subversion openjdk-8-jdk python python-pip python-dev python3 python3-pip python3-dev
apt -y install kernel-package dkms kmod
apt -y install linux-image-lowlatency linux-headers-lowlatency
