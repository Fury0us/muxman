#!/bin/bash
#start asci intro here
clear
echo $'\e[0m'
asci_intro() {
echo $'\e[1;32m*********************************************\e[0m'
echo $'\e[1;32m* __  __                 __  __             *\e[0m'
echo $'\e[1;32m*|  \/  |_   ___  __    |  \/  | __ _ _ __  *\e[0m'
echo $'\e[1;32m*| |\/| | | | \ \/ /____| |\/| |/ _` | `_ \ *\e[0m'
echo $'\e[1;32m*| |  | | |_| |>  <_____| |  | | (_| | | | |*\e[0m'
echo $'\e[1;32m*|_|  |_|\__,_/_/\_\    |_|  |_|\__,_|_| |_|*\e[0m'
echo $'\e[1;32m*********************************************\e[0m'
}
credits() {
echo $'\e[1;36m              (                                \e[0m'
echo $'\e[1;36m    )         )\ )                  )          \e[0m'
echo $'\e[1;36m ( /( (      (()/(  (  (   (     ( /(   (      \e[0m'
echo $'\e[1;36m )\()))\ )    /(_))))\ )(  )\ )  )\()) ))\ (   \e[0m'
echo $'\e[1;36m((_)\(()/( _ (_))_/((_(()\(()/( ((_)\ /((_))\  \e[0m'
echo $'\e[1;36m| |(_))(_)(_)| __|_))( ((_))(_))/  (_(_))(((_) \e[0m'
echo $'\e[1;36m| `_ | || |_ | __| || | `_| || | // || | (_-< \e[0m'
echo $'\e[1;36m|_.__/\_, (_)|_|  \_,_|_|  \_, |\__/ \_,_/__/ \e[0m'
echo $'\e[1;36m      |__/                 |__/                \e[0m'
}
root_art() {
echo $'\e[1;31m______ _____  _____ _____ \e[0m'
echo $'\e[1;31m| ___ \  _  ||  _  |_   _|\e[0m'
echo $'\e[1;31m| |_/ / | | || | | | | |  \e[0m'
echo $'\e[1;31m|    /| | | || | | | | |  \e[0m'
echo $'\e[1;31m| |\ \| \_/ /\ \_/ / | |  \e[0m'
echo $'\e[1;31m\_| \_|\___/  \___/  \_/  \e[0m'
}
file_menu() {
COLUMNS=12
asci_intro
echo -en '\n'
root_art
echo -en '\n'
PS3=("#fileman: ")
filesman=("Custom Location" "Termux to Downloads(Internal)" "Downloads to Termux(Home)" "Open File Permissions" "Previous Menu" "Main Menu")
select fil in "${filesman[@]}"; do
case $fil in
"Custom Location")
read -p $'\e[31mFile Location?: \e[0m' flloc
echo -en '\n'
read -p $'\e[31mCopy Location?: \e[0m' cploc
echo -en '\n'
echo $'\e[31mMAKE SURE TSU IS INSTALLED\e[0m'
sleep 2
sudo cp $flloc $cploc
file_menu
;;
"Termux to Downloads(Internal)")
read -p $'\e[31mFile?: \e[0m' tdfl
echo -en '\n'
echo $'\e[31mMAKE SURE TSU IS INSTALLED!\e[0m'
sleep 2
sudo cp /data/data/com.termux/files/home/"$tdfl" /storage/self/primary/Download
file_menu
;;
"Downloads to Termux(Home)")
read -p $'\e[31mFile?: \e[0m' dtfl
echo -en '\n'
echo $'\e[31mMAKE SURE TSU IS INSTALLED!\e[0m'
sleep 2
sudo cp /storage/self/primary/Download/"$dtfl" /data/data/com.termux/files/home
file_menu
;;
"Open File Permissions")
echo -en '\n'
echo $'\e[31mThis will change a files permissions so that anyone can read, write, and execute\e[0m'
echo -en '\n'
sleep 3
read -p $'\e[31mFile?: \e[0m' xfile
echo -en '\n'
sudo chmod a+rwx $xfile
echo -en '\n'
file_menu
;;
"Previous Menu")
clear
surootmenu
;;
"Main Menu")
clear
main_menu
;;
esac
done
}
tools_menu() {
COLUMNS=12
echo ""
asci_intro
echo ""
PS3=("#tools: ")
toolsmenu=("Install Tool-X" "Install Sqlmap" "Install Wifite" "Install Airgeddon" "Install Nikto" "Install fsociety" "Previous Menu")
select too in "${toolsmenu[@]}"; do
case $too in
"Install Tool-X")
apt update -y &&
apt upgrade -y &&
apt install git &&
git clone https://github.com/fu8uk1/Tool-X.git &&
cd Tool-X &&
chmod +x install.aex &&
sh install.aex &&
./install.aex
;;
"Install Sqlmap")
pkg update -y &&
pkg upgrade -y &&
apt install python python2 -y &&
pkg install git -y &&
git clone https://github.com/sqlmapproject/sqlmap &&
cd sqlmap &&
chmod +x sqlmap.py &&
echo -en '\n'
echo $'\e[31mYou can run Sqlmap as follows: \e[0m'
echo -en '\n'
echo $'\e[31mcd sqlmap & python2 sqlmap.py\e[0m'
echo -en '\n'
sleep 3 &&
python3 sqlmap.py
tools_menu
;;
"Install Wifite")
apt update -y &&
apt upgrade -y &&
apt install git python2 -y &&
git clone https://github.com/derv82/wifite2.git &&
cd wifite2 &&
chmod +x Wifite.py &&
chmod +x setup.py &&
python2 setup.py install
echo "Wifite has been installed, please make sure you have root functionality or it wont work"
echo -en '\n'
echo "best to install as root user to prevent issues"
sleep 3
tools_menu
;;
"Install Airgeddon")
pkg update -y &&
pkg upgrade -y &&
pkg install git python ffmpeg wget curl &&
git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git &&
cd airgeddon &&
echo "Airgeddon has been installed, please make sure you have root functionality or it wont work"
echo -en '\n'
echo "best to install as root user to prevent issues"
sleep 3
tools_menu
;;
"Install Nikto")
apt update -y &&
apt upgrade -y &&
pkg install git -y &&
pkg install perl -y &&
git clone https://github.com/sullo/nikto.git &&
cd nikto &&
cd program &&
perl nikto.pl -h &&
echo -en '\n' &&
echo $'\e[31mYou can run site scans as follows:\e[0m'
echo -en '\n'
echo $'\e[31mcd nikto & cd program & perl nikto.pl -h <website>\e[0m'
echo -en '\n'
sleep 3
tools_menu
;;
"Install fsociety")
pkg install git -y &&
pkg install wget -y &&
pkg install python2 -y &&
git clone https://github.com/Manisso/fsociety.git &&
cd fsociety &&
chmod +x install.sh &&
bash install.sh &&
echo -en '\n' &&
echo $'\e[31mYou can run fsociety by cd into fsociety and run python2 fsociety.py\e[0m' &&
echo -en '\n' &&
sleep 3 &&
python2 fsociety.py
tools_menu
;;
"Previous Menu")
clear
termux_config
;;
esac
done
}
#start the main menu function
main_menu() {
asci_intro
echo -en '\n'
credits
echo -en '\n'
COLUMNS=12
PS3=("#: ")
echo $'\e[36m'
options=("Ping Google" "list IP address" "list MAC address" "update and upgrade" "termux config" "SU MENU(ROOT)" "Exit")
select opt in "${options[@]}"; do
case $opt in
          "Ping Google")
          ping google.com
          main_menu
          COLUMNS=12
          ;;
          "list IP address")
          echo -en '\n'
          ifconfig wlan0 | grep inet
          echo -en '\n'
          main_menu
          COLUMNS=12
          ;;
          "list MAC address")
          echo -en '\n'
          ifconfig wlan0 | grep spec
          echo -en '\n'
          main_menu
          COLUMNS=12
          ;;
          "update and upgrade")
          echo -en '\n'
          pkg update && pkg upgrade -y
          echo -en '\n'
          main_menu
          COLUMNS=12
          ;;
          "termux config")
          clear
          echo -en '\n'
          termux_config
          COLUMNS=12
          ;;
          "SU MENU(ROOT)")
          clear
          echo -en '\n'
          surootmenu
          COLUMNS=12
          ;;
          "Exit")
          clear
          exit
          ;;
esac
done
echo $'\e[0m'
}
#termux_config section
surootmenu() {
echo ""
asci_intro
echo ""
root_art
echo ""
COLUMNS=12
echo -en '\n'
PS3=("#super: ")
surtmnu=("Install Sudo Functionality" "SU session" "Device Options" "Transfer to/from internal storage" "Auditing Tools" "Main Menu" "Exit")
select surt in "${surtmnu[@]}"; do
case $surt in
"Install Sudo Functionality")
pkg update &&
pkg upgrade &&
pkg install tsu &&
clear &&
echo $'\e[31myou can now use the "sudo" command to run normal linux like commands\e[0m'
sleep 2
surootmenu
;;
"SU session")
echo -en '\n'
echo $'\e[1;31mtype "exit" to return to terminal! \e[0m'
echo -en '\n'
su
;;
"Device Options")
clear
dev_opt
COLUMNS=12
;;
"Transfer to/from internal storage")
clear
file_menu
;;
"Auditing Tools")
clear
aud_tools
COLUMNS=12
;;
"Main Menu")
clear
main_menu
COLUMNS=12
;;
"Exit")
clear
exit
;;
esac
done
}
aud_tools() {
echo ""
asci_intro
echo ""
root_art
echo ""
COLUMNS=12
PS3=("#aud: ")
aud=("nmap scan" "Nikto Scan" "Previous" "Main" "exit")
select a in "${aud[@]}"; do
case $a in
"nmap scan")
PS3=("#nmap: ")
nmp=("check install" "basic scan" "full scan(TCP)" "previous menu" "root menu")
select n in "${nmp[@]}"; do
case $n in
"check install")
read -p $'\e[1;36mapt or pkg?: \e[0m' pg
if [ "$pg" == "apt" ]; then
apt install nmap
elif [ "$pg" == "pkg" ]; then
pkg install nmap
fi
;;
"basic scan")
read -p $'\e[1;36mDomain or IPto scan?: \e[0m' domain
echo ""
sudo nmap -v -sn -Pn $domain
;;
"full scan(TCP)")
read -p $'\e[1;36mDomain or IPto scan?: \e[0m' domain
echo ""
sudo nmap -A -Pn $domain
;;
"Nikto Scan")
read -p $'\e[31mWebsite?: \e[0m' site
cd ~ &&
cd nikto &&
cd program &&
perl nikto.pl -h $site
;;
"previous menu")
clear
aud_tools
;;
"root menu")
clear
surootmenu
;;
esac
done
;;
"Previous")
clear
surootmenu
;;
"Main")
clear
main_menu
;;
"exit")
exit
;;
esac
done
}
dev_opt() {
echo ""
asci_intro
echo ""
root_art
echo ""
COLUMNS=12
PS3=("#devopt: ")
devopt=("Change All Device Information" "IP Menu" "MAC Menu" "Main" "Exit")
select devo in "${devopt[@]}"; do
case $devo in
"Change All Device Information")
clear
change_dev_info
;;
"IP Menu")
clear
asci_intro
ip_menu
COLUMNS=12
;;
"MAC Menu")
clear
asci_intro
mac_menu
COLUMNS=12
;;
"Main")
clear
main_menu
;;
"Exit")
clear
exit
;;
esac
done
}
mac_menu() {
echo "mac menu"
dev_opt
}
ip_menu() {
echo "ip menu"
dev_opt
}
change_dev_info() {
echo "spoof device"
dev_opt
}
ohmyzshmenu() {
#oh-my-zsh menu
COLUMNS=12
echo ""
asci_intro
echo ""
PS3=("#ohmzsh: ")
ohmyshell=("Change Color" "Change Font" "Set Alias" "Previous Menu")
select ohm in "${ohmyshell[@]}"; do
case $ohm in
"Change Color")
chcolor
ohmyzshmenu
;;
"Change Font")
chfont
ohmyzshmenu
;;
"Set Alias")
read -p $'\e[31mAlias name?(terminal shortut): \e[0m' ali
echo ""
read -p $'\e[31mPath to script matching alias?: \e[0m' scph
echo ""
cd ~ &&
echo "alias $ali='$scph'" >> .zshrc
echo ""
echo $'\e[36mAlias Created, please restart termux\e[0m'
sleep 1
echo ""
ohmyzshmenu
;;
"Previous Menu")
clear
termux_config
;;
esac
done
}
termux_config() {
COLUMNS=12
echo ""
asci_intro
echo ""
PS3=("#: ")
options=("Setup Termux" "Tools Menu" "Remove Default Termux Start Message" "Set Custom Startup Message" "neofetch(rxfetch) startup" "Set Figlet Startup Message" "Install oh-my-zsh" "oh-my-zsh menu" "View Installed Packages" "Search For Package" "Install rxfetch(neofetch)" "Install Package" "Change Repo" "Install X11 Repo" "Install Root Repo" "Main Menu" "Exit")
select opt in "${options[@]}"; do
case $opt in
          "Setup Termux")
          termux-setup-storage
          pkg install git -y &&
          pkg install wget -y &&
          pkg install x11-repo -y &&
          pkg install root-repo -y &&
          pkg update -y &&
          pkg upgrade -y
          echo $'\e[31mTermux Has Been Set Up Successfully!\e[0m'
          sleep 2
          clear
          termux_config
          COLUMNS=12
          ;;
          "Tools Menu")
          clear
          tools_menu
          ;;
          "Remove Default Termux Start Message")
          cd ~ && cd .. && cd usr && cd etc &&
          rm -rf motd
          read -p $'\e[31mWould you like to dl figlet or own or no?(fig/own/no): \e[0m' var1
          if [ $var1 = "fig" ]
          then
               pkg install figlet &&
               cd ~ &&
               cd .. &&
               cd usr &&
               cd etc &&
               echo -n "figlet -f standard Mux" >> bash.bashrc
          elif [ $var1 = "own" ]
          then
               echo $'\e[1;31mEDIT VIA usr/etc/profile.d/init-termux-properties.sh file\e[0m'
               sleep 3
          else
               echo $'\e[1;31mEDIT VIA usr/etc/profile.d/init-termux-properties.sh file \e[0m'
               sleep 3
          fi
          termux_config
          COLUMNS=12
          ;;
          "Set Custom Startup Message")
          echo ""
          echo $'\e[1;36mTermux will now open a nano editor at the startup location\e[0m'
          echo ""
          echo $'\e[1;36mcopy and paste asci art, or use figlet, set statup scripts, etc.\e[0m'
          echo ""
          sleep 1 &&
          cd ~ &&
          cd .. &&
          nano usr/etc/profile.d/init-termux-properties.sh &&
          termux_config
          COLUMNS=12
          ;;
          "neofetch(rxfetch) startup")
          echo ""
          echo $'\e[31mTHIS STEP IS BEST DONE LAST\e[0m'
          read -p $'\e[31mCONTINUE?: \e[0m' cont
          echo ""
          if [ "$cont" == "yes"  ]
          then
          cd ~ &&
          cd .. &&
          echo "rxfetch" >> usr/etc/profile.d/init-termux-properties.sh
          echo ""
          echo $'\e[36mRestart termux to take effect\e[0m'
          sleep 1 &&
          clear
          termux_config
          COLUMNS=12
          else
          sleep 1 &&
          clear
          termux_config
          COLUMNS=12
          fi
          ;;
          "Set Figlet Startup Message")
          echo ""
          read -p $'\e[36mStartup Message?: \e[0m' smsg
          echo ""
          cd ~ &&
          cd .. &&
          echo "figlet -f banner $smsg" >> usr/etc/profile.d/init-termux-properties.sh &&
          echo ""
          echo $'\e[1;36mRestart termux to take effect\e[0m'
          sleep 1 &&
          clear
          termux_config
          COLUMNS=12
          ;;
          "Install oh-my-zsh")
          read -p $'\e[31mAre you sure?(yes/no)\e[0m' choicee
          if [ $choicee = "yes" ] || [ $choicee = "y" ]
          then
               sh -c "$(curl -fsSL https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh)"
          elif [ $choicee = "no" ] || [ $choicee = "n" ]
          then
               termux_config
          fi
          termux_config
          COLUMNS=12
          ;;
          "oh-my-zsh menu")
          echo ""
          clear
          ohmyzshmenu
          termux_config
          COLUMNS=12
          ;;
          "View Installed Packages")
          pkg list-installed
          termux_config
          COLUMNS=12
          ;;
          "Search For Package")
          read -p $'\e[31mQuery?: \e[0m' package
          pkg search $package
          termux_config
          COLUMNS=12
          ;;
          "Install rxfetch(neofetch)")
          pkg install rxfetch
          clear
          rxfetch
          termux_config
          COLUMNS=12
          ;;
          "Install Package")
          read -p $'\e[31mPackage?: \e[0m' package
          pkg install $package
          termux_config
          COLUMNS=12
          ;;
          "Change Repo")
          termux-change-repo
          termux_config
          COLUMNS=12
          ;;
          "Install X11 Repo")
          pkg install x11-repo
          termux_config
          COLUMNS=12
          ;;
          "Install Root Repo")
          pkg install root-repo
          termux_config
          COLUMNS=12
          ;;
          "Main Menu")
          clear
          asci_intro
          echo -en '\n'
          credits
          echo -en '\n'
          main_menu
          COLUMNS=12
          ;;
          "Exit")
          clear
          exit
          ;;
esac
done
}
echo $'\e[0m'
main_menu
echo $'\e[0m'
