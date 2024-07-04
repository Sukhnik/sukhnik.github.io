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
	echo -e "\t${red} --=={Fly around the world!}==-- ${end}"
	exit 0
}

function menu(){
	clear; sukhoi_foot
	echo -e "\t${greenColour}1${redColour})${endColour}Weight fuel calculus\n\t"
	read -p "[ menu@console ](փ)>> " wk

	if [ $wk = 1 ]; then
		weight_calculus
	else
		echo -e "\n\t${redColour}unvalid answer${endColour}\n\t"; sleep 2
		menu
	fi
}

function dependencies() {
	tput civis
	clear
	dependencies=(toilet npm)

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

	read -p "$( echo -e ${redColour}"[ weight_calculus@console ](փ)>> ${endColour}") " ssk
	if [ $ssk = 1 ]; then
		C_130J_30
	elif [ $ssk = 2 ]; then
		F_22_Raptor
	else
		atka_skip
	fi
}

# Oil prices curl

function o_p(){
	curl -s "https://www.airlines.org/dataset/argus-us-jet-fuel-index/" | html2text | grep "Jet Fuel Spot Prices Over One Year" -A 5
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
	o_p
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
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

# Script action

if [ "$(id -u)" == "1000" ]; then
	# parameters
	parameter_d=false
	# conditions
	while getopts ":d:" arg; do
		case $arg in
			d) parameter_d=true; distance_parameter=$OPTARG ;;
			h) helpPanel ;;
		esac
	done
	menu

else
	echo -e "\n\t${redColour}You cannot launch this script being ${yellowColour}$(whoami)${redColour} user${endColour}\n\t"
fi
