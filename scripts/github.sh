#!/bin/bash

function github () {

  case $1 in
    "-b") gitBranch="`echo ${1} | cut -d'=' -f2`"; shift;; 
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

  gitShellStr="git clone -b ${gitBranch} --depth=1 ${gitUrl2} ${gitOut}

}

github $@
