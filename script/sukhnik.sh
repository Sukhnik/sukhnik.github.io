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
	                                                                                                                                                      
                                                                                                                                                      
               .:---:         :.                                                                                                                      
            :*@@@@@@@@%=    -%-                                                                                                                       
           +@@@@@@@@@@%+--+.                                                                                                                          
          .@@@@@@@%+-:=#@@-           .*#*****      +*     +%      +*    -%:     -%     %-     .@@-   #*      +*#@#**:     :@.   .#=                  
           +##*+- .=%@@@@@#           *@.  .        @-     @+      @=.. *#.      ##    =@      +%=@- :@-        =@         #%.. =@-                   
               .=%@@@@@@@@#           .=:  %#      -@     =%      =@++=+@.      :@#***=%*      @= +@-*%         %+        .@*++:@=                    
            :+##+-.  .+@@@:          :----=%+       #%==+#*.      @+    @*      *%    -@:     -@   +@@=     .--+@+--      +@    *@                    
         .:=-.        .@%:           :----:.         .::.         -     .:      :.    .:      .:    :-      .------:      :.     -.                   
                     :+-                                                                                                                              
                                                                                                                                                      
                                                                                                                                                      
                                                                                                                                                      
${endColour}"
}

function sukhnik_foot() {
	echo -e "
  
                                          
    #### #   # #   # #   # #   # #   # #   # 
   #      # #  #  #   # #  #   # #  ## #  #  
   #       #   ###     #   ##### # # # ###   
   #      #    #  #   # #  #   # ##  # #  #  
    #### #     #   # #   # #   # #   # #   # 

  "
}

function ctrl_c() {
	clear
	echo -e "\t${red} --=={Fly around the world!}==-- ${end}"
	exit 0
}

function menu() {
	clear
	sukhnik_foot
	sleep 0.3
	clear
	sukhoi_foot
	echo -e "\t${greenColour}1${redColour})${endColour}Weight fuel calculus\n\t${greenColour}2${redColour})${endColour}Crosswind component calculation\n\t${greenColour}3${redColour})${endColour}Density altitude calculation\n\t${greenColour}4${redColour})${endColour}True airspeed calculation\n\t${greenColour}5${redColour})${endColour}Descent rate calculation\n\t${greenColour}6${redColour})${endColour}Calculate CG\n\t${greenColour}7${redColour})${endColour}Calculate ETA\n\t"
	read -p "$(echo -e "${redColour}[ menu@console ](փ)>> ${endColour}")" wk

	case $wk in
	1) weight_calculus ;;
	2) calculate_crosswind ;;
	3) calculate_density_altitude ;;
	4) calculate_true_airspeed ;;
	5) calculate_descent_rate ;;
	6) calculate_cg ;;
	7) calculate_eta ;;
	*)
		echo -e "\n\t${redColour}unvalid answer${endColour}\n\t"
		sleep 2
		menu
		;;
	esac
}

function dependencies() {
	tput civis
	clear
	dependencies=(toilet bc curl html2text)

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
	echo -e "3)${greenColour}Boeing 737-800${endColour}"
	echo -e "4)${greenColour}Boeing 777-200LR${endColour}"
	echo -e "5)${greenColour}Boeing 787-9${endColour}"
	echo -e "6)${greenColour}Airbus A320${endColour}"
	echo -e "7)${greenColour}Airbus A321${endColour}"
	echo -e "8)${greenColour}Airbus A350-900${endColour}"

	read -p "$(echo -e ${redColour}"[ weight_calculus@console ](փ)>> ${endColour}") " ssk
	case $ssk in
	1) C_130J_30 ;;
	2) F_22_Raptor ;;
	3) Boeing_737_800 ;;
	4) Boeing_777_200LR ;;
	5) Boeing_787_9 ;;
	6) Airbus_A320 ;;
	7) Airbus_A321 ;;
	8) Airbus_A350_900 ;;
	*) atka_skip ;;
	esac
}

# Oil prices curl

function o_p() {
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

function Boeing_737_800() {
	a=$(echo "scale=2; 2.51 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 872" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 2600 " | bc)
	w=$(echo "scale=2; $b / 2.51" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

function Boeing_777_200LR() {
	a=$(echo "scale=2; 4.77 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 902" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 3200 " | bc)
	w=$(echo "scale=2; $b / 4.77" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

function Boeing_787_9() {
	a=$(echo "scale=2; 2.82 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 561" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 1500 " | bc)
	w=$(echo "scale=2; $b / 2.82" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

function Airbus_A320() {
	a=$(echo "scale=2; 2.47 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 870" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 2400 " | bc)
	w=$(echo "scale=2; $b / 2.47" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

function Airbus_A321() {
	a=$(echo "scale=2; 2.75 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 870" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 2600 " | bc)
	w=$(echo "scale=2; $b / 2.75" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

function Airbus_A350_900() {
	a=$(echo "scale=2; 5.17 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 936" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 4000 " | bc)
	w=$(echo "scale=2; $b / 5.17" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

# Crosswind component calculation

function calculate_crosswind() {
	read -p "$(echo -e ${yellowColour}"Enter runway heading (degrees): "${endColour})" runway_heading
	read -p "$(echo -e ${yellowColour}"Enter wind direction (degrees): "${endColour})" wind_direction
	read -p "$(echo -e ${yellowColour}"Enter wind speed (knots): "${endColour})" wind_speed
	wind_angle=$(echo "$wind_direction - $runway_heading" | bc)
	crosswind=$(echo "$wind_speed * s($wind_angle * 4*a(1) / 180)" | bc -l)
	echo -e "${greenColour}Crosswind component:${endColour} ${crosswind} knots"
}

# Density altitude calculation

function calculate_density_altitude() {
	read -p "$(echo -e ${yellowColour}"Enter pressure altitude (feet): "${endColour})" pressure_altitude
	read -p "$(echo -e ${yellowColour}"Enter outside air temperature (Celsius): "${endColour})" oat
	density_altitude=$(echo "$pressure_altitude + (120 * ($oat - 15))" | bc)
	echo -e "${greenColour}Density altitude:${endColour} ${density_altitude} feet"
}

# True airspeed calculation

function calculate_true_airspeed() {
	read -p "$(echo -e ${yellowColour}"Enter indicated airspeed (knots): "${endColour})" indicated_airspeed
	read -p "$(echo -e ${yellowColour}"Enter pressure altitude (feet): "${endColour})" pressure_altitude
	read -p "$(echo -e ${yellowColour}"Enter outside air temperature (Celsius): "${endColour})" oat
	true_airspeed=$(echo "$indicated_airspeed + (2 * $pressure_altitude / 1000) + (1.2 * $oat)" | bc)
	echo -e "${greenColour}True airspeed:${endColour} ${true_airspeed} knots"
}

# Descent rate calculation

function calculate_descent_rate() {
	read -p "$(echo -e ${yellowColour}"Enter ground speed (knots): "${endColour})" ground_speed
	read -p "$(echo -e ${yellowColour}"Enter descent angle (degrees): "${endColour})" descent_angle
	descent_rate=$(echo "$ground_speed * (tan($descent_angle * 4*a(1) / 180)) * 101.27" | bc -l)
	echo -e "${greenColour}Descent rate:${endColour} ${descent_rate} feet per minute"
}

# Calculate CG

function calculate_cg() {
	read -p "$(echo -e ${yellowColour}"Enter total weight (lbs): "${endColour})" total_weight
	read -p "$(echo -e ${yellowColour}"Enter moment arm (inches): "${endColour})" moment_arm
	cg=$(echo "$moment_arm / $total_weight" | bc -l)
	echo -e "${greenColour}Center of Gravity (CG):${endColour} ${cg} inches"
}

# Calculate ETA

function calculate_eta() {
	read -p "$(echo -e ${yellowColour}"Enter distance to destination (nautical miles): "${endColour})" distance
	read -p "$(echo -e ${yellowColour}"Enter ground speed (knots): "${endColour})" ground_speed
	eta=$(echo "scale=2; $distance / $ground_speed" | bc)
	hours=$(echo "$eta" | cut -d'.' -f1)
	minutes=$(echo "scale=2; ($eta - $hours) * 60" | bc)
	echo -e "${greenColour}Estimated Time of Arrival (ETA):${endColour} ${hours} hours and ${minutes} minutes"
}

# Main script execution

function main() {
	dependencies
	menu
}

# Script action

if [ "$(id -u)" == "1000" ]; then
	# parameters
	parameter_d=false
	# conditions
	while getopts ":d:" arg; do
		case $arg in
		d)
			parameter_d=true
			distance_parameter=$OPTARG
			;;
		h) helpPanel ;;
		esac
	done
	menu

else
	echo -e "\n\t${redColour}You cannot launch this script being ${yellowColour}$(whoami)${redColour} user${endColour}\n\t"
fi
