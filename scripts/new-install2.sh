#!/usr/bin/sudo /bin/bash
apt -yq update
apt -yq install apt-utils
apt -yq install iputils-* net-tools psmisc sudo nano perl-base curl cifs-utils openssh-server samba dnsutils python python-pip \
tilda dialog zenity libncurses5-dev libncursesw5-dev
apt -yq install finch libpurple-dev libjson-glib-dev
apt -yq install locales-all tzdata console-setup keyboard-configuration
apt -yq install build-essential automake autoconf autotools-dev autoproject autogen autopoint llvm gccgo gfortran maven \
ninja-build cmake qt5-default qt5-qmake bison flex nasm yasm byacc libtool intltool texinfo texi2html doxygen pandoc git cvs \
mercurial subversion openjdk-8-jdk python python-pip python-dev python3 python3-pip python3-dev
apt -yq install kernel-package dkms kmod
apt -yq install linux-image-lowlatency linux-headers-lowlatency
