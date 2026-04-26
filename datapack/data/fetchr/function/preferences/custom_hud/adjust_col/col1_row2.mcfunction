#> fetchr:preferences/custom_hud/adjust_col/col1_row2
#
# Executes the selected action for row 2
#
# @within function fetchr:preferences/custom_hud/adjust_col/col1
# @context entity Player who triggered fetchr.pref
#
# @reads score @s fetchr.pref
# @writes storage fetchr:custom_hud current_player.components

execute \
	if score @s fetchr.pref matches 58 \
	run data \
		modify storage tmp.fetchr:preferences/hud swap \
		set from storage fetchr:custom_hud current_player.components[7]
execute \
	if score @s fetchr.pref matches 58 \
	run data \
		modify storage fetchr:custom_hud current_player.components[7] \
		set from storage fetchr:custom_hud current_player.components[6]
execute \
	if score @s fetchr.pref matches 58 \
	run data \
		modify storage fetchr:custom_hud current_player.components[6] \
		set from storage tmp.fetchr:preferences/hud swap

execute \
	if score @s fetchr.pref matches 59 \
	run data \
		modify storage tmp.fetchr:preferences/hud to_be_added \
		set from storage fetchr:custom_hud current_player.components[7]
execute \
	if score @s fetchr.pref matches 59 \
	run function fetchr:preferences/custom_hud/add_to_col0
execute \
	if score @s fetchr.pref matches 59..60 \
	run data \
		modify storage fetchr:custom_hud current_player.components[7] \
		set from storage fetchr:custom_hud current_player.components[8]
execute \
	if score @s fetchr.pref matches 59..60 \
	run data \
		modify storage fetchr:custom_hud current_player.components[8] \
		set from storage fetchr:custom_hud current_player.components[9]
execute \
	if score @s fetchr.pref matches 59..60 \
	run data \
		modify storage fetchr:custom_hud current_player.components[9] \
		set from storage fetchr:custom_hud current_player.components[10]
execute \
	if score @s fetchr.pref matches 59..60 \
	run data modify storage fetchr:custom_hud current_player.components[10] set value { id: "fetchr:empty" }