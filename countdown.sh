#!/bin/sh 

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

now=`date +%s` 
until=`date -d "Feb 22 2016 8:00" +%s` 
sec_rem=`expr $until - $now` 
 
secToDay $sec_rem
secToHour $sec_rem
secToMin $sec_rem

echo -n $days":"
echo -n $hours":"
echo -n $minutes":"
echo -n $sec_rem
echo
