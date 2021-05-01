#!/bin/bash
#Define colors for script
LGREEN='\033[1;32m'
LCYAN='\033[1;36m'
LRED='\033[1;31m'
#COPY README AND CHECK IF MAIN SCRIPT EXISTS IN HOME DIR
#IF IT ISNT, COPY IT THERE, MAKE IT EXECUTABLE, THEN RUN IT.
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
sudo cp "${NEWDIR}/wiki.png" /usr/share/pixmaps/wiki.png
sleep 1
echo -e "${LGREEN}Files Copied"
chmod u+x "${NEWDIR}/Kiwix-Manager.sh"
echo -e "Script made Executable"
#Make Help Files
printf " -Once zims download the first time, running the download option will only update that zim if needed, otherwise it is skipped. This means you can use the download option anytime just to ensure your zim file and associated library entry are up to date.\n(Works great with often-updated zims like WikiNews.)\n\n -Unchanged zims will show no progress bar on-screen during the download script. Be calm, It works." > "${NEWDIR}/Download.hlp"
printf " -When you choose to Install Kiwix(Option #1), it will install kiwix-serve, kiwix-manage, and kiwix-read to the /usr/local/bin directory.\n\n -Installation success is dependent on correct file locations being used when asked for them by this script. If you made an error, simply run Option #7 on the main menu to correct the mistake.\n\n -If you already have Kiwix installed, when you run option #1 and install Kiwix, it will overwrite the previous files, and update kiwix if a newer version exists from kiwix.org.\n\n -The service name you enter when this script asks, will be used to create the service in /etc/systemd/system/. It is important you entered correct zim and library locations when asked. If any mistakes were made, you can run option #8 to uninstall Kiwix, then run Option #7 to reset this script, and start from scratch." > "${NEWDIR}/Install.hlp"
printf " -The library_zim.xml IS NOT overwritten each time you run this script, it is only added to, unless you choose option #5 to delete entries.\n\n -If you see a difference between number of zims and number of XML entries, it is usually due to that zim not having information on kiwix.org for their xml handler(kiwix-manage) to use. (I noticed this is the case for about 40 of the StackExchange Zims.)\n\n -The Library file is backed up before every file operation it is used in. These files are given a Date/Time in their filename. When restoring you can select from the backup files available." > "${NEWDIR}/Library_zim.xml.hlp"
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
echo -e " (or for your convenience, Desktop and panel shortcuts were made)"
			echo -e ""
			echo -e "${LCYAN}Press any key to continue..."
			read -n 1 -s
bash "${NEWDIR}/Kiwix-Manager.sh"
