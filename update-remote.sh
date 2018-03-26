#!/bin/bash
git remote remove origin
git remote add origin https://imnx@github.com/imnx/$(basename ${PWD})

