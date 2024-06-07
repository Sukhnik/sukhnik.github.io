#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
#-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

# Function parameters

trap ctrl_c INT

function sukhoi_foot() {
	echo -e "${redColour}
	::::::::::.                                                                       
     .-:          .::                                                                     
    -.        -:-    -:                                               .                   
   -          :: ::  .-:                                                                  
  -.        ..:=-::-=:.       ------.   --    --   -:  :-:   .-.   .-:   -------:   -:    
  = .:--==-:.  .-    -:      .=-:::-:   ==    ==   ==-=-.    .=-----=-  .=:    -=  .=-    
  =      ..::::--:..-:       .-::::==   -=::::=-   =- :--:   .=:   .=-  .=-::::==  .=-    
  .-          .- .=:::--       .....     ......    .    ...   .     .     ......    .     
   :-         =:::   .-                                                                   
    .-:            .-:                                                                    
       ::::.....:::.                                                                      ${endColour}"
}

function ctrl_c() {
	clear
	echo -e "\t${red} --=={Hack the world!}==-- ${end}"
	exit 0
}

function openscope() {
	tput civis
	dependencies=(openscope)

	echo -e "\t[!] Checking status script"
	sleep 2

	for program in "${dependencies[@]}"; do
		echo -ne "---------->\t"
		test -d $program

		if [ "(echo $?)" == "0" ]; then
			echo -e "${greenColour}(Running)${endColour}"
			cd openscope
			npm run start
		else
			dependencies
			git clone https://github.com/openscope/openscope.git
			cd openscope
			npm install
			npm run built
			npm run start
		fi
		sleep 1
	done
}

function dependencies() {
	tput civis
	clear
	dependencies=(aircrack-ng msfconsole toilet npm)

	echo -e "\t${yellowColour}[!]Checking dependencies${endColour}"
	sleep 2

	for program in "${dependencies[@]}"; do
		echo -ne "\t\t Status:"
		test -f /sbin/$program

		if [ "$(echo $?)" == "0" ]; then
			echo -e "${greenColour}OK!${endColour}"
		else
			sudo pacman -S $program --noconfirm >/dev/null 2>&1
			echo -e "${yellowColour}Installing dependencies${endColour}"
		fi
		sleep 1
	done
}

function atka_sukhoi_menu() {
	clear
	sukhoi_foot
	read -p "[ sukhoi@console ](փ)>> " sk
	if [ $sk = "openscope" ]; then
		openscope
	elif [ $sk = "weight_calculus" ]; then
		AutomaticWeightCalculus
	else
		atka_sukhoi_menu
	fi
}

function atka_skip() {
	clear
	read -p "DO YOU WANT TO STOP THE SCRIPT? [y/n] " chh
	if [ $chh = "y" ]; then
		exit 0
	elif [ $chh = "Y" ]; then
		exit 0
	elif [ $chh = "yes" ]; then
		exit 0
	elif [ $chh = "YES" ]; then
		exit 0
	else
		atka_menu
	fi
}

function atka_menu() {
	clear
	toilet -f pagga Sukhnik
	echo -e "\t 1) Install Strap"
	echo -e "\t 2) Update"
	echo -e "\t 3) Launch Tor"
	echo -e "\t${redColour} 4) Sukhoi menu${endColour}"
	echo -e "\t 5) exit"

	read -p "(sukhnik@console)>> " ch
	if [ $ch = 1 ]; then
		dependencies
	elif [ $ch = 2 ]; then
		git pull
	elif [ $ch = 3 ]; then
		cd .tor-browser
		sleep 0.2
		./start-tor-browser.desktop
	elif [ $ch = 4 ]; then
		atka_sukhoi_menu
	elif [ $ch ]; then
		atka_skip
	else
		atka_skip
	fi
}

function atka_updater() {
	clear
	toilet -f pagga Sukhnik
	sudo pacman -Sy
	sleep 2
	atka_menu
}

# Sukhoi functions

function AutomaticWeightCalculus() {
	clear
	echo -e "${yellowColour}Sukhoi shell scripting automatic weight calculus help panel${endColour}"
	echo -e "--------------------------------------------------------------------"
	echo -e "\t\t${yellowColour}./sukhnik -d 8500"
	echo -e "d) Distance in nautic miles ${redColour}nm${endColour}"
	echo -e "h) ${greenColour}Help Panel execuiting${endColour}"
}

function weight_calculus() {
	clear
	sukhoi_foot
	echo -e "${yellowColour}Aircrafts menu${endColour}"
	echo -e "----------------------"
	echo -e "1)${greenColour}C-130J-30 Military Aircraft${endColour}"
	echo -e "2)${greenColour}F-22 Raptor${endColour}"

	read -p "[ weight_calculus@console ](փ)>> " ssk
	if [ $ssk = 1 ]; then
		C_130J_30
	elif [ $ssk = 2 ]; then
		F_22_Raptor
	else
		atka_skip
	fi
}

# Aircrafts

function C_130J_30() {
	a=$(echo "scale=2; 9.92 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 4225" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 10250 " | bc)
	w=$(echo "scale=2; $b / 9.73" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

function F_22_Raptor() {
	a=$(echo "scale=2; 0.38 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 650" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 6000 " | bc)
	w=$(echo "scale=2; $b / 0.48" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

# Script action

if [ "$(id -u)" == "1000" ]; then
	declare -i parameter_counter=0
	while getopts ":d:h:" arg; do
		case $arg in
		d)
			distance_parameter=$OPTARG
			let parameter_counter+=1
			;;
		h) HelpPanel ;;
		esac
	done

	if [ $parameter_counter -ne 1 ]; then
		atka_updater
	else
		weight_calculus

	fi
else
	echo -e "\n\t${redColour}You cannot launch this script being ${yellowColour}$(whoami)${redColour} user${endColour}\n\t"
fi
