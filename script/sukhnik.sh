#!/bin/bash

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
	read -p "[ menu@console ](փ)>> " wk

	case $wk in
		1) weight_calculus ;;
		2) crosswind_calculation ;;
		3) density_altitude_calculation ;;
		4) true_airspeed_calculation ;;
		5) descent_rate_calculation ;;
		6) calculate_cg ;;
		7) calculate_eta ;;
		*) echo -e "\n\t${redColour}Invalid option${endColour}\n\t" ;;
	esac
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
	if [[ $chh =~ ^[Yy](es)?$ ]]; then
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
	echo -e "d) Distance in nautical miles ${redColour}nm${endColour}"
	echo -e "h) ${greenColour}Help Panel executing${endColour}"
}

function weight_calculus() {
	clear
	sukhoi_foot
	echo -e "${yellowColour}Aircrafts menu${endColour}"
	echo -e "----------------------"
	echo -e "1)${greenColour}C-130J-30 Military Aircraft${endColour}"
	echo -e "2)${greenColour}F-22 Raptor${endColour}"
	echo -e "3)${greenColour}Boeing 737${endColour}"
	echo -e "4)${greenColour}Boeing 777${endColour}"
	echo -e "5)${greenColour}Boeing 787${endColour}"
	echo -e "6)${greenColour}Airbus A320${endColour}"
	echo -e "7)${greenColour}Airbus A321${endColour}"
	echo -e "8)${greenColour}Airbus A350${endColour}"
	echo -e "9)${greenColour}McDonnell Douglas MD-11F${endColour}"
	echo -e "10)${greenColour}Spitfire Mk VIII${endColour}"
	echo -e "11)${greenColour}P-38 Lightning${endColour}"

	read -p "$(echo -e ${redColour}"[ weight_calculus@console ](փ)>> ${endColour}") " ssk
	case $ssk in
		1) C_130J_30 ;;
		2) F_22_Raptor ;;
		3) Boeing_737 ;;
		4) Boeing_777 ;;
		5) Boeing_787 ;;
		6) Airbus_A320 ;;
		7) Airbus_A321 ;;
		8) Airbus_A350 ;;
		9) MD_11F ;;
		10) Spitfire_Mk_VIII ;;
		11) P_38 ;;
		*) atka_skip ;;
	esac
}

# Functions for each aircraft

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

function Boeing_737() {
	a=$(echo "scale=2; 0.20 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 570" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 3800 " | bc)
	w=$(echo "scale=2; $b / 0.82" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

function Boeing_777() {
	a=$(echo "scale=2; 0.40 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 560" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 8000 " | bc)
	w=$(echo "scale=2; $b / 0.83" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

function Boeing_787() {
	a=$(echo "scale=2; 0.35 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 560" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 7000 " | bc)
	w=$(echo "scale=2; $b / 0.84" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

function Airbus_A320() {
	a=$(echo "scale=2; 0.22 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 570" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 4000 " | bc)
	w=$(echo "scale=2; $b / 0.81" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

function Airbus_A321() {
	a=$(echo "scale=2; 0.23 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 570" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 4100 " | bc)
	w=$(echo "scale=2; $b / 0.82" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

function Airbus_A350() {
	a=$(echo "scale=2; 0.32 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 560" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 7000 " | bc)
	w=$(echo "scale=2; $b / 0.83" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

function MD_11F() {
	a=$(echo "scale=2; 0.50 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 570" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 14000 " | bc)
	w=$(echo "scale=2; $b / 0.85" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

function Spitfire_Mk_VIII() {
	a=$(echo "scale=2; 0.10 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 250" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 400 " | bc)
	w=$(echo "scale=2; $b / 0.13" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

function P_38() {
	a=$(echo "scale=2; 0.15 * $distance_parameter" | bc)
	t=$(echo "scale=2; $a / 320" | bc)
	sleep 0.2
	echo -e "Time:${yellowColour}$t${endColour}${greenColour}hours${endColour}"
	b=$(echo "scale=2; $t * 600 " | bc)
	w=$(echo "scale=2; $b / 0.19" | bc)
	sleep 0.2
	echo -e "Weight:${yellowColour}$w${endColour}${greenColour}Kg${endColour}"
	z=$(echo "scale=2; $w * 2" | bc)
	sleep 0.2
	echo -e "Total Oil Weight:${yellowColour}$z${endColour}${greenColour}Kg${endColour}"
	o_p
	echo -e "${yellowColour}\n\t\033[5mGood Travel!\033[0m\n\t${endColour}"
}

# Crosswind Component Calculation
function crosswind_calculation() {
	clear
	read -p "Enter wind speed (knots): " wind_speed
	read -p "Enter wind angle (degrees): " wind_angle
	read -p "Enter runway heading (degrees): " runway_heading
	wind_angle_relative=$(echo "$wind_angle - $runway_heading" | bc)
	crosswind_component=$(echo "scale =2; $wind_speed * s($wind_angle_relative * 0.0174533)" | bc -l)
	tailwind_component=$(echo "scale=2; $wind_speed * c($wind_angle_relative * 0.0174533)" | bc -l)

	echo -e "Crosswind Component: ${yellowColour}${crosswind_component} knots${endColour}"
	echo -e "Tailwind Component: ${yellowColour}${tailwind_component} knots${endColour}"
}

# Density Altitude Calculation
function density_altitude_calculation() {
	clear
	read -p "Enter pressure altitude (feet): " pressure_altitude
	read -p "Enter outside air temperature (Celsius): " oat

	density_altitude=$(echo "$pressure_altitude + (120 * ($oat - 15))" | bc)

	echo -e "Density Altitude: ${yellowColour}${density_altitude} feet${endColour}"
}

# True Airspeed Calculation
function true_airspeed_calculation() {
	clear
	read -p "Enter indicated airspeed (knots): " ias
	read -p "Enter pressure altitude (feet): " pressure_altitude
	read -p "Enter outside air temperature (Celsius): " oat

	temperature_kelvin=$(echo "$oat + 273.15" | bc)
	true_airspeed=$(echo "$ias + (2 * $pressure_altitude / 1000) + (0.02 * $oat)" | bc)

	echo -e "True Airspeed: ${yellowColour}${true_airspeed} knots${endColour}"
}

# Descent Rate Calculation
function descent_rate_calculation() {
	clear
	read -p "Enter groundspeed (knots): " groundspeed
	read -p "Enter descent angle (degrees): " descent_angle

	descent_rate=$(echo "$groundspeed * 101.27 * tan($descent_angle * 0.0174533)" | bc -l)

	echo -e "Descent Rate: ${yellowColour}${descent_rate} feet per minute${endColour}"
}

# Calculate Center of Gravity (CG)
function calculate_cg() {
	clear
	read -p "Enter total weight (lbs): " total_weight
	read -p "Enter moment (inch-lbs): " moment

	cg=$(echo "scale=2; $moment / $total_weight" | bc)

	echo -e "Center of Gravity: ${yellowColour}${cg} inches${endColour}"
}

# Calculate Estimated Time of Arrival (ETA)
function calculate_eta() {
	clear
	read -p "Enter distance to destination (nautical miles): " distance
	read -p "Enter ground speed (knots): " ground_speed

	time_hours=$(echo "scale=2; $distance / $ground_speed" | bc)
	hours=$(echo "$time_hours / 1" | bc)
	minutes=$(echo "($time_hours - $hours) * 60" | bc | awk '{printf "%d\n",$1}')

	echo -e "Estimated Time of Arrival: ${yellowColour}${hours} hours and ${minutes} minutes${endColour}"
}

function o_p() {
	curl -s "https://www.airlines.org/dataset/argus-us-jet-fuel-index/" | html2text | grep "Jet Fuel Spot Prices Over One Year" -A 5
}

parameter_d=false

while getopts ":d:" arg; do
	case $arg in
		d) parameter_d=true; distance_parameter=$OPTARG ;;
	esac
done

menu

