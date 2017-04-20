#!/bin/bash
if [[ "${1}" && "${2}" ]]; then
  if [[ -e "${1}" && -d "${1}" ]]; then
    if [[ -e "${2}" && -d "${2}" ]]; then
      printf "\n[copy-rootfs]: cloning rootfs \'${1}\' to \'${2}\' using command-line \'tar -C "${1}" -cvf - . | tar -C "${2}" -xf -\'..\n\n"
      tar -C "${1}" -cvf - . | tar -C "${2}" -xf -
      printf "\n[copy-rootfs]: done cloning rootfs \'${1}\' to \'${2}\'.\n"
    fi
  fi
fi
