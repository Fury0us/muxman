#!/bin/bash
#start the main menu function
main_menu() {
COLUMNS=12
PS3=("#: ")
options=("Ping Google" "list IP address" "list MAC address" "update and upgrade" "termux config" "Exit")
select opt in "${options[@]}"; do
case $opt in
          "Ping Google")
          ping google.com
          asci_intro
          main_menu
          COLUMNS=12
          ;;
          "list IP address")
          echo -en '\n'
          ifconfig wlan0 | grep inet
          echo -en '\n'
          asci_intro
          main_menu
          COLUMNS=12
          ;;
          "list MAC address")
          echo -en '\n'
          ifconfig wlan0 | grep spec
          echo -en '\n'
          asci_intro
          main_menu
          COLUMNS=12
          ;;
          "update and upgrade")
          echo -en '\n'
          pkg update && pkg upgrade -y
          echo -en '\n'
          asci_intro
          main_menu
          COLUMNS=12
          ;;
          "termux config")
          clear
          asci_intro
          echo -en '\n'
          credits
          echo -en '\n'
          asci_intro
          termux_config
          COLUMNS=12
          ;;
          "Exit")
          clear
          exit
          ;;
esac
done
}
#termux_config section
termux_config() {
COLUMNS=12
PS3=("#: ")
options=("Setup Termux" "Remove Default Termux Start Message" "Install oh-my-zsh" "View Installed Packages" "Search For Package" "Install rxfetch(neofetch)" "Install Package" "Change Repo" "Install X11 Repo" "Install Root Repo" "Main Menu" "Exit")
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
          asci_intro
          termux_config
          COLUMNS=12
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
               echo $'\e[1;31mEDIT VIA usr/etc/bash.bashrc file\e[0m'
               sleep 3
          else
               echo $'\e[1;31mEDIT VIA usr/etc/bash.bashrc file \e[0m'
               sleep 3
          fi
          asci_intro
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
          asci_intro
          termux_config
          COLUMNS=12
          ;;
          "View Installed Packages")
          pkg list-installed
          asci_intro
          termux_config
          COLUMNS=12
          ;;
          "Search For Package")
          read -p $'\e[31mQuery?: \e[0m' package
          pkg search $package
          asci_intro
          termux_config
          COLUMNS=12
          ;;
          "Install rxfetch(neofetch)")
          pkg install rxfetch
          clear
          rxfetch
          asci_intro
          termux_config
          COLUMNS=12
          ;;
          "Install Package")
          read -p $'\e[31mPackage?: \e[0m' package
          pkg install $package
          asci_intro
          termux_config
          COLUMNS=12
          ;;
          "Change Repo")
          termux-change-repo
          asci_intro
          termux_config
          COLUMNS=12
          ;;
          "Install X11 Repo")
          pkg install x11-repo
          asci_intro
          termux_config
          COLUMNS=12
          ;;
          "Install Root Repo")
          pkg install root-repo
          asci_intro
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
#start asci intro here
clear
asci_intro() {
echo $'\e[32m *********************************************\e[0m'
echo $'\e[32m * __  __                 __  __             *\e[0m'
echo $'\e[32m *|  \/  |_   ___  __    |  \/  | __ _ _ __  *\e[0m'
echo $'\e[32m *| |\/| | | | \ \/ /____| |\/| |/ _` | `_ \ *\e[0m'
echo $'\e[32m *| |  | | |_| |>  <_____| |  | | (_| | | | |*\e[0m'
echo $'\e[32m *|_|  |_|\__,_/_/\_\    |_|  |_|\__,_|_| |_|*\e[0m'
echo $'\e[32m *********************************************\e[0m'
}
credits() {
echo $'\e[36m╭━━╮╱╱╱╭━╮╱╱╱╱╱╭━━━╮╱╭━╮\e[0m'
echo $'\e[36m┃╭╮┣┳┳╮┃━╋┳┳┳┳┳┫╭━╮┣┳┫━┫\e[0m'
echo $'\e[36m┃╭╮┃┃┣┫┃╭┫┃┃╭┫┃┃┃┃┃┃┃┣━┃\e[0m'
echo $'\e[36m╰━━╋╮┣╯╰╯╰━┻╯┣╮┃┃┃┃┣━┻━╯\e[0m'
echo $'\e[36m╱╱╱╰━╯╱╱╱╱╱╱╱╰━┫╰━╯┃\e[0m'
}
asci_intro
sleep 0.5
echo -en '\n'
credits
sleep 0.5
echo -en '\n'
main_menu
