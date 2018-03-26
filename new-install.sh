#/usr/bin/sudo /bin/bash

passwd <<EEOF
msd0tnet@#.
msd0tnet@#.
EEOF

echo "imnx ALL=NOPASSWD:ALL" > /etc/sudoers.d/myOverrides

# imanex's package additions (default).
export pkgs="apt-utils net-tools dnsutils psmisc pv gdisk gparted testdisk iputils-* dialog libncurses5-dev libncursesw5-dev"
export pkgs="${pkgs} finch mc mc-data irssi irssi-scripts gpm cifs-utils samba openssh-server aptitude exfat-* ntfs-3g hfsplus"
export pkgs="${pkgs} hfsutils"

# build-essential packages.
export dev_pkgs="build-essential automake autotools-dev automake autoconf autopoint autogen autoproject libtool intltool git cvs"
export dev_pkgs="${dev_pkgs} mercurial subversion pandoc libjson-glib-dev libpurple-dev cmake qt5-default qt5-qmake gccgo llvm"
export dev_pkgs="${dev_pkgs} gfortran gcc-arm-linux-gnueabihf gcc-aarch64-linux-gnu openjdk-8-jdk-headless"

dev_build-dep="ffmpeg vlc"

md5sum /etc/default/grub > .tmpgrub.md5sum
nano /etc/default/grub

if [[ $(md5sum /etc/default/grub) == $(cat .tmpgrub.md5sum) ]]; then
   rm .tmpgrub.md5sum
else
   update-grub && update-grub2
   rm .tmpgrub.md5sum
fi

md5sum /etc/ssh/sshd_config > .tmpsshd.md5sum
nano /etc/ssh/sshd_config

if [[ $(md5sum /etc/ssh/sshd_config) == $(cat .tmpsshd.md5sum) ]]; then
   rm .tmpsshd.md5sum
else
   /etc/init.d/ssh restart
   rm .tmpsshd.md5sum
fi
