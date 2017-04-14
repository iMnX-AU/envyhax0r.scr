#!/bin/bash

function github () {

  setBranch="0"

  case $1 in
    "-b") gitBranch="`echo ${1} | cut -d'=' -f2`"; setBranch="1"; shift;; 

    *) true ;;
  esac 

  gitUrl="http://github.com/"
  gitUser="`echo ${1} | cut -d'/' -f1`"
  gitRepo="`echo ${1} | cut -d'/' -f2`"
  gitUrl2="${gitUrl}${1}"

  if [[ ! ${2} ]]; then
    gitOut="`echo ${2} | cut -d'/' -f2`"
  else
    gitOut="${2}"
  fi

  if [[ setBranch == "1" ]]; then
    gitShellStr="git clone -b ${gitBranch} --depth=1 ${gitUrl2} ${gitOut}"
  else
    gitShellStr="git clone -b master --depth=1 ${gitUrl2} ${gitOut}"
  fi

  ${gitShellStr}

}

github $@
