#!/bin/bash
#COPY README AND CHECK IF MAIN SCRIPT EXISTS IN HOME DIR
#IF IT ISNT, COPY IT THERE, MAKE IT EXECUTABLE, THEN RUN IT.
LGREEN='\033[1;32m'
LCYAN='\033[1;36m'
LRED='\033[1;31m'
DIRECTORY="$(readlink -f "$(dirname "$0")")"
NEWDIR="$HOME/Kiwix-Manager-RPi"
(if [ ! -e "${NEWDIR}" ]; then
mkdir "${NEWDIR}"
sleep 1
echo -e "${LGREEN}Directory Created: ${NEWDIR}/"
else
echo -e "${LRED}Directory Exists: ${NEWDIR}/"
echo -e "${LGREEN}Refreshing Files"
fi)
mv "processHelper.pim" "${NEWDIR}/Kiwix-Manager.sh"
mv "README.md" "${NEWDIR}/README.md"
mv "wiki.png" "${NEWDIR}/wiki.png"
mv "LICENSE" "${NEWDIR}/LICENSE"
sudo rm -rf "${DIRECTORY}/_config.yml"
sudo cp "${NEWDIR}/wiki.png" /usr/share/pixmaps/wiki.png
sleep 1
echo -e "${LGREEN}Files Copied"
chmod u+x "${NEWDIR}/Kiwix-Manager.sh"
echo -e "Script made Executable"
printf " -Once zims download the 1st time, running the download option will only upate that zim if needed, otherwise it is skipped.\n\n -Unchanged zims will show no progress bar on-screen during the download script. Be calm, It works!\n\n -The library_zim.xml IS NOT overwritten each time you run this script, it is only added to, unless you choose option #5 to delete entries.\n\n -If you see a difference between number of zims and number of XML entries, it is usually due to that zim not having information on kiwix.org for their xml handler(kiwix-manage) to use." > "${NEWDIR}/KIWIX-README"
rm -rf $(basename $0) 
sleep 1
cd "${NEWDIR}"
sudo rm -rf "${DIRECTORY}"
echo "Creating menu button"
echo "[Desktop Entry]
Name=Kiwix Manager
Comment=Install, Uninstall, Add/remove Zims, Manage Library XML
Exec=${NEWDIR}/Kiwix-Manager.sh
Icon=${NEWDIR}/wiki.png
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
cd "${NEWDIR}"
echo -e ""
echo -e "${LGREEN}You can now run the program from ${NEWDIR}/Kiwix-Manager.sh"
			echo -e ""
			echo -e "${LCYAN}Press any key to continue..."
			read -n 1 -s
bash "${NEWDIR}/Kiwix-Manager.sh"
