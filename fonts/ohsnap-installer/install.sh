#!/bin/bash
sudo cp 50-ohsnap-enable.conf /etc/fonts/conf.d/
sudo cp *.pcf /usr/share/fonts/X11/misc/
sudo cp *.psfu /usr/share/fonts/X11/misc/
sudo dpkg-reconfigure fontconfig

