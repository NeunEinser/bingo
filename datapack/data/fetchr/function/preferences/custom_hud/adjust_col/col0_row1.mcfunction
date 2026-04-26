#> fetchr:preferences/custom_hud/adjust_col/col0_row1
#
# Executes the selected action for row 1
#
# @within function fetchr:preferences/custom_hud/adjust_col/col0
# @context entity Player who triggered fetchr.pref
#
# @reads score @s fetchr.pref
# @writes storage fetchr:custom_hud current_player.components

execute \
	if score @s fetchr.pref matches 41 \
	run data \
		modify storage tmp.fetchr:preferences/hud swap \
		set from storage fetchr:custom_hud current_player.components[1]
execute \
	if score @s fetchr.pref matches 41 \
	run data \
		modify storage fetchr:custom_hud current_player.components[1] \
		set from storage fetchr:custom_hud current_player.components[0]
execute \
	if score @s fetchr.pref matches 41 \
	run data \
		modify storage fetchr:custom_hud current_player.components[0] \
		set from storage tmp.fetchr:preferences/hud swap

execute \
	if score @s fetchr.pref matches 41 \
	run data \
		modify storage tmp.fetchr:preferences/hud to_be_added \
		set from storage fetchr:custom_hud current_player.components[1]
execute \
	if score @s fetchr.pref matches 42 \
	run function fetchr:preferences/custom_hud/add_to_col1
execute \
	if score @s fetchr.pref matches 42..43 \
	run data \
		modify storage fetchr:custom_hud current_player.components[1] \
		set from storage fetchr:custom_hud current_player.components[2]
execute \
	if score @s fetchr.pref matches 42..43 \
	run data \
		modify storage fetchr:custom_hud current_player.components[2] \
		set from storage fetchr:custom_hud current_player.components[3]
execute \
	if score @s fetchr.pref matches 42..43 \
	run data \
		modify storage fetchr:custom_hud current_player.components[3] \
		set from storage fetchr:custom_hud current_player.components[4]
execute \
	if score @s fetchr.pref matches 42..43 \
	run data \
		modify storage fetchr:custom_hud current_player.components[4] \
		set value { id: "fetchr:empty" }