
setup() {
	load source_library
}

@test "days" {
	secToDay 86400
	[[ "$days" == 1 ]]
	[[ "$sec_rem" == 0 ]]

	secToDay 90000
	[[ "$days" == 1 ]]
	[[ "$sec_rem" == 3600 ]]

	secToDay 5000
	[[ "$days" == 0 ]]
	[[ "$sec_rem" == 5000 ]]
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
