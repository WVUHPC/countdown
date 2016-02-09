#!/bin/bash 
 
source lib/libconvert.bash

if [ "$#" -lt "2" ] ; then 
	echo "Incorrect usage ! Example:" 
	echo './countdown.sh -d  "Jun 10 2011 16:06"' 
	echo 'or' 
	echo './countdown.sh -m  90' 
	exit 1 
fi 
 
now=`date +%s` 
 
if [ "$1" = "-d" ] ; then 
	until=`date -d "$2" +%s` 
	sec_rem=`expr $until - $now` 
	if [ $sec_rem -lt 1 ]; then 
		echo "$2 already past" 
	fi 
fi 
 
if [ "$1" = "-m" ] ; then 
	until=`expr 60 \* $2` 
	until=`expr $until + $now` 
	sec_rem=`expr $until - $now` 
	echo "-m" 
	if [ $sec_rem -lt 1 ]; then 
		echo "$2 already past" 
	fi 
fi 
 
secToDay $sec_rem
secToHour $sec_rem
secToMin $sec_rem

echo -n $days":"
echo -n $hours":"
echo -n $minutes":"
echo -n $sec_rem
echo
