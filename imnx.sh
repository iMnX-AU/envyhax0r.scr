#!/bin/bash

# Always build using GCCv6.

PKGCONFIG="`which pkg-config`"
CC="`which gcc-6`"
CXX="`which g++-6`"
AR="`which gcc-ar-6`"
RANLIB="`which gcc-ranlib-6`"
NM="`which gcc-nm-6`"
GCCGO="`which gccgo-6`"


# todo: toggled build host/build specification.
# doing it manually for now.

buildHOST=""
buildBUILD=""
#buildHOST="--host=x86_64-pc-linux-gnu"
#buildBUILD="--build=x86_64-pc-linux-gnu"

# Script functions.

function configurePROJECT () {
   if [[ -e "./autogen.sh" ]]; then
      sudo ./autogen.sh --prefix=/usr ${buildHOST} ${buildBUILD} --enable-shared --enable-static $@
   elif [[ -e "./configure.ac" ]]; then
      sudo ./autoreconf -vis; sleep 0.5; sudo automake --force-missing --copy --add-missing; sleep 0.5; sudo autoconf
   else
      printf "[$(basename $0)]: couldn't preconfigure/autoconfigure, can't find 'autogen.sh' script or configure.ac within project directory.\n"
   fi
   if [[ -e "./configure" ]]; then
      sudo ./configure --prefix=/usr ${buildHOST} ${buildBUILD} --enable-shared --enable-static $@
   else
      printf "[$(basename $0)]: couldn't configure, can't find configure script within project directory.\n"
   fi
}

function makePROJECT () {
   sudo make -j4
}

function installPROJECT () {
   sudo make -j4 install
}

function cmakePROJECT () {
   sudo mkdir -p build.imnx && sudo cd ./build.imnx
   sudo cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

function editSCRIPT () {
   sudo nano ~/.bin/imnx.sh
}

# Starting case, function selection.

case $1 in
   config) printf "[$(basename $0)]: configuring project...\n"; shift; configurePROJECT $@;;
   make) printf "[$(basename $0)]: compiling/building project...\n"; shift; makePROJECT;;
   cmake) printf "[$(basename $0)]: compiling/building project using cmake builder...\n"; shift; cmakePROJECT $@;;
   make-install) printf "[$(basename $0)]: installing project...\n"; shift; installPROJECT;;
   edit) printf "[$(basename $0)]: editing $(basename $0) script...\n"; shift; editSCRIPT;;
   *) printf " usage: $(basename $0) (config|build|build-cmake|install)\n";;
esac

exit 0
