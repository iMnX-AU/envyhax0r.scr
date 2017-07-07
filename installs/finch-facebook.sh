#!/usr/bin/sudo /bin/bash
apt-get -y install pandoc libpurple-dev libjson-glib-dev finch -q --no-install-recommends
apt-get -y build-dep libpurple-dev finch -q --no-install-recommends
git clone -b master --depth=1 http://services.homenet.h0ax.net/imnx/libpurple-facebook
cd libpurple-facebook/
./autogen.sh --prefix=/usr --enable-shared && ./configure --prefix=/usr --enable-shared && make -j8 && make -j8 install
cd ..
rm -r libpurple-facebook/
exit 0
