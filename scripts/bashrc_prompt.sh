#!/bin/bash
echo 'export PS1="\[$(tput bold)\]\[\033[38;5;25m\][\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;250m\]\u\[$(tput sgr0)\]\[\033[38;5;241m\]@\[$(tput sgr0)\]\[\033[38;5;68m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;66m\]\w\[$(tput sgr0)\]\[\033[38;5;245m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;24m\]]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]"' >> ~/.bashrc
source ~/.bashrc
