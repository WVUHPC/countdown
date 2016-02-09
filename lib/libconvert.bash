
function secToDay {

	secondsInDay=86400

	days=0
	sec_rem=${1}

	if [ "$1" -ge "$secondsInDay"  ]; then
		days=$( echo "$1 / $secondsInDay" | bc)
	
		remove=`expr $secondsInDay \* $days`
		sec_rem=`expr $1 - $remove`
	fi

	return 0
}

function secToHour {

	secondsInHour=3600

	hours=0
	sec_rem=${1}

	if [ "$1" -ge "$secondsInHour" ]; then
		hours=$( echo "$1 / $secondsInHour" | bc)

		remove=`expr $secondsInHour \* $hours`
		sec_rem=`expr $1 - $remove`
	fi

	return 0
}

function secToMin {
	
	secondsInMin=60

	minutes=0
	sec_rem=${1}

	if [ "$1" -ge "$secondsInMin" ]; then
		minutes=$(echo "$1 / $secondsInMin" | bc)

		remove=`expr $secondsInMin \* $minutes`
		sec_rem=`expr $1 - $remove`
	fi

	return 0
}
