#!/bin/bash

if [ ! -n "$OPENBOX" ]; then
	OPENBOX=~/.openbox-inst
fi

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
	sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 
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
	sudo cp $OPENBOX/templates/slim /etc/slim.conf
	cp $OPENBOX/templates/tint2/tint2rc  ~/.config/tint2/
	cp $OPENBOX/templates/openbox/autostart ~/.config/openbox/
	cp $OPENBOX/templates/openbox/rc.xml ~/.config/openbox/
	cp $OPENBOX/templates/openbox/.conkyrc cp ~/

	sudo cp -Rf $OPENBOX/templates/openbox/bin/*  /usr/bin/
	tar -xvf  $OPENBOX/files/waldorf.tar.gz
	cp -Rv $OPENBOX/files/waldorf/* /usr/share/themes/
fi
 

echo "\033[0;32m"'    _______  _______  _______  _______  _______    '"\033[0m"
echo "\033[0;32m"'   / ___   )(  ___  )(  ____ )(  ____ \(  ____ \   '"\033[0m"
echo "\033[0;32m"'   \/   )  || (   ) || (    )|| (    \/| (    \/   '"\033[0m"
echo "\033[0;32m"'       /   )| |   | || (____)|| |      | (__       '"\033[0m"
echo "\033[0;32m"'      /   / | |   | ||     __)| | ____ |  __)      '"\033[0m"
echo "\033[0;32m"'     /   /  | |   | || (\ (   | | \_  )| (         '"\033[0m"
echo "\033[0;32m"'    /   (_/\| (___) || ) \ \__| (___) || (____/\   '"\033[0m"
echo "\033[0;32m"'   (_______/(_______)|/   \__/(_______)(_______/   '"\033[0m"
echo "\033[0;32m"'                                                   '"\033[0m"