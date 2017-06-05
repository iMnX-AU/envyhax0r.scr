#!/bin/bash

if [[ $1 ]]; then
  if [[ $2 ]]; then
    curDir="$(pwd)"
    tar -cvf - ${1} | xz -9 -c - > "${2}"
    cd "${curDir}"
  else
    printf "arg2 is not set.\n"
  fi
else
  printf "arg1 is not set.\n"
fi
