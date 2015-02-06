#!/bin/bash
# runs as user "user" on a stock ubuntu-standard install.

mydir=$(dirname $(readlink -f $BASH_SOURCE))

sudo apt-get update && apt-get upgrade
sudo apt-get install emacs24
sudo apt-get install mate-desktop-environment
sudo apt-get install dconf-editor
sudo apt-get install git gitk cmake gnutls-bin
sudo apt-get install language-pack-en language-pack-gnome-en
sudo apt-get install ruby

# some cleanups and work arounds

sudo apt-get remove --purge light-locker-settings light-locker

echo 'f /sys/class/backlight/backlight.12/brightness 0666 - - - 800' | sudo tee  /etc/tmpfiles.d/brightness.conf
sudo cp $mydir/backlight /usr/local/bin/

sudo ln -sf /bin/bash /bin/sh
sudo cgpt add -i 6 -P 5 -S 1 /dev/mmcblk0

echo "harm" | sudo tee /etc/hostname
sudo hostname harm

echo "Now reboot to assure Ubuntu is default"
