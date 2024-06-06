function helpPanel() {
	echo -e "./atka"
	echo -e "----------"
	echo -e "k) commit name"
	echo -e "example: ./atka -k 'myy first commit' "
}

declare -i paramater_counter=0
while getopts ":k:h:" arg; do
	case $arg in
	k)
		commit_name=$OPTARG
		let paramater_counter+=1
		;;
	h) helpPanel ;;
	esac
done

if [ $paramater_counter -ne 1 ]; then
	helpPanel
else
	git add . && git commit -m $commit_name
	git push
fi
