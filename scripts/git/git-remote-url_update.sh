#!/bin/bash
git config --global --edit
git remote set-url origin https://imnx@github.com/imnx/$(basename $(pwd)).git
git push --set-upstream origin master
