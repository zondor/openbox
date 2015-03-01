#!/bin/bash

if [ ! -n "$OPENBOX" ]; then
	OPENBOX=~/.openbox-inst
fi

VIRTBOX=`dmesg | grep -w "BIOS VirtualBox"`
VIRTRES=$?


show_error() {
	echo -e "\033[41m"╬►"\033[41m" Error : $1 "\033[0m"
}
show_head() {
	echo ""
	echo -e "\033[42m"▂▃▅▇█▓▒░"\033[0m""\033[45m" $1 "\033[0m""\033[42m"░▒▓█▇▅▃▂"\033[0m"
	echo ""
}
show_succes() {
	echo -e "\033[92m"◉ $1"\033[0m"
}

show_head "Installing extra packages"
if [ $VIRTRES != 0 ]; then
	show_succes "VirtualBox detected, installing extrapackages for it"
	sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 
fi

sudo apt-get install slim xorg openbox obmenu obconf tint2 xfce4-power-manager xfce4-terminal gmrun thunar thunar-dbg thunar-vcs-plugin thunar-volman thunar-archive-plugin thunar-data xfce4-settings gnome-icon-theme-full lxappearance volti gksu nitrogen clipit terminator zsh xscreensaver leafpad conky -y
show_succes "packages = ok"


show_head "Creating folders"

if [ ! -d ~/.config ]; then
	mkdir ~/.config
	mkdir -p ~/.config/tint2
	mkdir -p ~/.config/openbox
fi

show_head "Installing extra packages"
if [ -d ~/.config ]; then
	
	cp $OPENBOX/templates/tint2/tint2rc  ~/.config/tint2/
	cp $OPENBOX/templates/openbox/autostart.sh ~/.config/openbox/
	cp $OPENBOX/templates/openbox/rc.xml ~/.config/openbox/
	cp $OPENBOX/templates/openbox/menu.xml ~/.config/openbox/

	cp $OPENBOX/templates/openbox/.conkyrc ~/

	sudo cp $OPENBOX/templates/slim.conf /etc/
	sudo cp -Rf $OPENBOX/templates/openbox/bin/*  /usr/bin/
	sudo chmod 777 /usr/bin/cb-exit /usr/bin/cb-lock /usr/bin/cb-places-pipemenu /usr/bin/cb-recent-files-pipemenu  /usr/bin/conkywonky


	tar -xvf  $OPENBOX/files/waldorf.tar.gz -C $OPENBOX/
	sudo cp -R $OPENBOX/waldorf/* ~/.themes/
	rm -R $OPENBOX/waldorf
fi
 


echo "\033[0;32m"'  														    '"\033[0m"
echo "\033[0;32m"'   .oOOOo.                                o                   '"\033[0m"
echo "\033[0;32m"'  .O     o.                              O                    '"\033[0m"
echo "\033[0;32m"'  O       o                              O                    '"\033[0m"
echo "\033[0;32m"'  o       O                              o                    '"\033[0m"
echo "\033[0;32m"'  O       o .oOo. .oOo.  OoOo. ooooooooo OoOo. .oOo. o   O    '"\033[0m"
echo "\033[0;32m"'  o       O O   o OooO  o   O           O   o O   o  OoO      '"\033[0m"
echo "\033[0;32m"'  `o     O` o   O O      O   o           o   O o   O  o o     '"\033[0m"
echo "\033[0;32m"'   `OoooO`  oOoO` `OoO  o   O           `OoO` `OoO` O   O     '"\033[0m"
echo "\033[0;32m"'             O                                                '"\033[0m"
echo "\033[0;32m"'             o                                                '"\033[0m"

echo "\033[0;44m"'  _ /~\ _ _  _    '"\033[0m"
echo "\033[0;44m"'  /_\_/| (_|(/_   '"\033[0m"
echo "\033[0;44m"'          _|      '"\033[0m"
