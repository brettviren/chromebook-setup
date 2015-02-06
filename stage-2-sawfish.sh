#!/bin/bash
mydir=$(dirname $(readlink -f $BASH_SOURCE))

# build and install sawfish packages

sudo apt-get install automake1.11 gir1.2-gtk-2.0 libatk1.0-dev libaudiofile-dev libesd0-dev libgmp-dev libgmpxx4ldbl libgtk2.0-dev libpango1.0-dev libtool libxcomposite-dev libxcursor-dev libxi-dev libxml2-utils libxrandr-dev x11proto-composite-dev x11proto-randr-dev libgdbm-dev libffi-dev texinfo libxtst-dev dh-autoreconf

pushd $mydir

git clone https://github.com/SawfishWM/librep.git
cd librep
fakeroot debian/rules binary-arch
cd ..
sudo dpkg -i librep16_*-1nano_armhf.deb \
             librep-dev_-1nano_armhf.deb \
             rep_*-1nano_armhf.deb

git clone https://github.com/SawfishWM/rep-gtk.git
cd rep-gtk
fakeroot debian/rules binary-arch
cd ..
sudo dpkg -i rep-gtk_*-1nano_armhf.deb

git clone https://github.com/SawfishWM/sawfish.git
cd sawfish
fakeroot debian/rules binary
cd ..
sudo dpkg -i sawfish-data_*-1nano_all.deb \
             sawfish_*-1nano_armhf.deb \
             sawfish-mate-session_*-1nano_all.deb

echo "now reboot"

