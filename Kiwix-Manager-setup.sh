#!/bin/bash
#COPY README AND CHECK IF MAIN SCRIPT EXISTS IN HOME DIR
#IF IT ISNT, COPY IT THERE, MAKE IT EXECUTABLE, THEN RUN IT.
LGREEN='\033[1;32m'
LCYAN='\033[1;36m'
LRED='\033[1;31m'
DIRECTORY="$(readlink -f "$(dirname "$0")")"

(if [ ! -e "$HOME/Kiwix-Manager-RPi" ]; then
mkdir "$HOME/Kiwix-Manager-RPi"
sleep 1
echo -e "${LGREEN}Directory Created: $HOME/Kiwix-Manager-RPi/"
else
echo -e "${LRED}Directory Exists: $HOME/Kiwix-Manager-RPi/"
echo -e "${LGREEN}Refreshing Files"
fi)
mv "processHelper.pim" "$HOME/Kiwix-Manager-RPi/Kiwix-Manager.sh"
mv "README.MD" "$HOME/Kiwix-Manager-RPi/README.MD"
mv "wiki.png" "$HOME/Kiwix-Manager-RPi/wiki.png"
sudo cp "$HOME/Kiwix-Manager-RPi/wiki.png" /usr/share/pixmaps/wiki.png
sleep 1
echo -e "${LGREEN}Files Copied"
chmod u+x "$HOME/Kiwix-Manager-RPi/Kiwix-Manager.sh"
echo -e "Script made Executable"
printf " -Once zims download the 1st time, running the download option will only upate that zim if needed, otherwise it is skipped.\n\n -Unchanged zims will show no progress bar on-screen during the download script. Be calm, It works!\n\n -The library_zim.xml IS NOT overwritten each time you run this script, it is only added to, unless you choose option #5 to delete entries.\n\n -If you see a difference between number of zims and number of XML entries, it is usually due to that zim not having information on kiwix.org for their xml handler(kiwix-manage) to use." > "$HOME/Kiwix-Manager-RPi/KIWIX-README"
rm -rf $(basename $0) 
sleep 1
cd "$HOME/Kiwix-Manager-RPi"
rm -rf "${DIRECTORY}"
echo "Creating menu button"
echo "[Desktop Entry]
Name=Kiwix Manager
Comment=Install, Uninstall, Add/remove Zims, Manage Library XML
Exec="$HOME/Kiwix-Manager-RPi/Kiwix-Manager.sh"
Icon="$HOME/Kiwix-Manager-RPi/wiki.png"
Terminal=true
Type=Application
Categories=Network;Other;Settings;" > ~/.local/share/applications/Kiwix-Manager.desktop
cp "$HOME/.local/share/applications/Kiwix-Manager.desktop" "$HOME/Desktop/Kiwix-Manager.desktop"
sudo cp "$HOME/.local/share/applications/Kiwix-Manager.desktop" "/usr/share/applications/Kiwix-Manager.desktop"
chmod u+x "$HOME/Desktop/Kiwix-Manager.desktop"
chmod u+x "$HOME/.local/share/applications/Kiwix-Manager.desktop"
sudo chmod u+x /usr/share/applications/Kiwix-Manager.desktop
sleep 1
#MAIN SCRIPT NEEDS TO BE RUN FROM HOME DIR
cd "$HOME/Kiwix-Manager-RPi"
echo -e ""
echo -e "${LGREEN}You can now run the program from $HOME/Kiwix-Manager-RPi/Kiwix-Manager.sh"
			echo -e ""
			echo -e "${LCYAN}Press any key to continue..."
			read -n 1 -s
bash "$HOME/Kiwix-Manager-RPi/Kiwix-Manager.sh"
