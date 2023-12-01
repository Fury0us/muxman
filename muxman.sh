#!/bin/bash
#start the main menu function
main_menu() {
COLUMNS=12
PS3=("#: ")
options=("list IP address" "list MAC address" "update and upgrade" "termux config" "Exit")
select opt in "${options[@]}"; do
case $opt in
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
          asci_intro
          echo -en '\n'
          credits
          echo -en '\n'
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
options=("Setup Termux" "Remove Default Termux Start Message" "Search For Package" "Install Package" "Change Repo" "Install X11 Repo" "Install Root Repo" "Main Menu" "Exit")
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
          termux_config
          COLUMNS=12
          ;;
          "Search For Package")
          read -p $'\e[31mQuery?: \e[0m' package
          pkg search $package
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
#start asci intro here
clear
asci_intro() {
echo $'\e[32m *********************************************'
echo $'\e[32m * __  __                 __  __             *'
echo $'\e[32m *|  \/  |_   ___  __    |  \/  | __ _ _ __  *'
echo $'\e[32m *| |\/| | | | \ \/ /____| |\/| |/ _` | `_ \ *'
echo $'\e[32m *| |  | | |_| |>  <_____| |  | | (_| | | | |*'
echo $'\e[32m *|_|  |_|\__,_/_/\_\    |_|  |_|\__,_|_| |_|*'
echo $'\e[32m *********************************************'
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
