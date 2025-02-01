#> fetchr:preferences/custom_hud/adjust_col/col1_row3
#
# Executes the selected action for row 3
#
# @within function fetchr:preferences/custom_hud/adjust_col/col1
# @context entity Player who triggered fetchr.pref
#
# @reads score @s fetchr.pref
# @writes storage fetchr:custom_hud currentPlayer.components

execute \
	if score @s fetchr.pref matches 55 \
	run data \
		modify storage tmp.fetchr:preferences/hud swap \
		set from storage fetchr:custom_hud currentPlayer.components[8]
execute \
	if score @s fetchr.pref matches 55 \
	run data \
		modify storage fetchr:custom_hud currentPlayer.components[8] \
		set from storage fetchr:custom_hud currentPlayer.components[7]
execute \
	if score @s fetchr.pref matches 55 \
	run data \
		modify storage fetchr:custom_hud currentPlayer.components[7] \
		set from storage tmp.fetchr:preferences/hud swap

execute \
	if score @s fetchr.pref matches 56 \
	run data \
		modify storage tmp.fetchr:preferences/hud toBeAdded \
		set from storage fetchr:custom_hud currentPlayer.components[8]
execute \
	if score @s fetchr.pref matches 56 \
	run function fetchr:preferences/custom_hud/add_to_col0
execute \
	if score @s fetchr.pref matches 56..57 \
	run data \
		modify storage fetchr:custom_hud currentPlayer.components[8] \
		set from storage fetchr:custom_hud currentPlayer.components[9]
execute \
	if score @s fetchr.pref matches 56..57 \
	run data \
		modify storage fetchr:custom_hud currentPlayer.components[9] \
		set from storage fetchr:custom_hud currentPlayer.components[10]
execute \
	if score @s fetchr.pref matches 56..57 \
	run data modify storage fetchr:custom_hud currentPlayer.components[10] set value { id: "fetchr:empty" }