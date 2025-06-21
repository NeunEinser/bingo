#> fetchr:preferences/dialog/exec
#
# Shows the appropiate dialog based on the trigger value
#
# @within function fetchr:tick/player_tick


execute \
	if score @s fetchr.pref_dialog matches 1..3 \
	run function fetchr:preferences/dialog/show_main

execute \
	if score @s fetchr.pref_dialog matches 4 \
	run function fetchr:preferences/dialog/show_adjust_components