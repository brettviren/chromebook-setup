#!/bin/bash

mydir=$(dirname $(readlink -f $BASH_SOURCE))


# Configure mate

# Capture it all in here.
rm $HOME/.config/dconf/user

# Touching gsettings causes mate-keybindings-properties to segfault
# Deleteing the .config/dconf/user "fixes" this.  Well, we don't care
# because we have Sawfish for key bindings anyways.

gsettings set org.gnome.settings-daemon.peripherals.touchpad disable-while-typing true
gsettings set org.mate.peripherals-touchpad disable-while-typing true
gsettings set org.mate.peripherals-touchpad horiz-scroll-enabled true
gsettings set org.mate.peripherals-touchpad scroll-method 2
gsettings set org.mate.peripherals-touchpad tap-to-click true
gsettings set org.mate.peripherals-touchpad touchpad-enabled true

gsettings set org.mate.peripherals-keyboard delay 250
gsettings set org.mate.peripherals-keyboard rate 50
gsettings set org.mate.peripherals-keyboard-xkb.kbd model pc101

gsettings set org.mate.interface gtk-theme 'TraditionalGreen'
gsettings set org.mate.caja.desktop network-icon-visible false
gsettings set org.mate.caja.desktop volumes-visible false
gsettings set org.mate.caja.desktop home-icon-visible false
gsettings set org.mate.caja.desktop computer-icon-visible false
gsettings set org.mate.caja.desktop trash-icon-visible false

dconf write /org/mate/terminal/profiles/default/use-system-font false
dconf write /org/mate/terminal/profiles/default/default-show-menubar false
dconf write /org/mate/terminal/profiles/default/scrollbar-position "'hidden'"
dconf write /org/mate/terminal/profiles/default/scrollback-lines 5120
dconf write /org/mate/terminal/profiles/default/font "'DejaVu Sans Mono 10'"


cp $mydir/dot.xinitrc $HOME/.xinitrc
cp $mydir/dot.Xmodmap $HOME/.Xmodmap
chmod +x $HOME/.xinitrc
echo "To apply key swaps immediately, run: $HOME/.xinitrc"

mkdir -p $HOME/.config/autostart
cat <<EOF > $HOME/.config/autostart/xinitrc.desktop
[Desktop Entry]
Type=Application
Exec=$HOME/.xinitrc
Hidden=false
X-MATE-Autostart-enabled=true
Name[en]=Xinitrc
Name=Xinitrc
Comment[en]=Do some misc setup in .xinitrc
Comment=Do some misc setup in .xinitrc
EOF

