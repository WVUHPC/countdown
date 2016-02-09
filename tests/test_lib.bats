
setup() {
	load source_library
}

@test "days" {
	run $( secToDay 86400; echo $days; echo $sec_rem )
	[[ ${lines[0]} == 1 ]]
	[[ ${lines[1]} == 0 ]]

	run $( secToDay 90000; echo $days; echo $sec_rem )
	[[ ${lines[0]} == 1 ]]
	[[ ${lines[1]} == 3600 ]]

	run $( secToDay 5000; echo $days; echo $sec_rem )
	[[ ${lines[0]} == 0 ]]
	[[ ${lines[1]} == 5000 ]]
}

@test "hours" {
	secToHour 3600
	[[ $hour -eq 1 ]]
	[[ $sec_rem -eq 0 ]]

	secToHour 4000
	[[ $hour -eq 1 ]]
	[[ $sec_rem -eq 400 ]]

	secToHour 2000
	[[ $hour -eq 0 ]]
	[[ $sec_rem -eq 2000 ]]
}

@test "minutes" {
	secToMin 60
	[[ $minutes -eq 1 ]]
	[[ $sec_rem -eq 0 ]]

	run secToMin 100
	[[ $minutes -eq 1 ]]
	[[ $sec_rem -eq 40 ]]

	run secToMin 45
	[[ $minutes -eq 0 ]]
	[[ $sec_rem -eq 45 ]]
}

@test "must pass" {
	results=$( expr 2 + 2 )
	[[ $results == 4 ]]
}
