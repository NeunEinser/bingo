#> fetchr:preferences/custom_hud/adjust_col/col1_row0
#
# Executes the selected action for row 0
#
# @within function fetchr:preferences/custom_hud/adjust_col/col1
# @context entity Player who triggered fetchr.pref
#
# @reads score @s fetchr.pref
# @writes storage fetchr:custom_hud current_player.components

execute \
	if score @s fetchr.pref matches 64 \
	run data \
		modify storage tmp.fetchr:preferences/hud to_be_added \
		set from storage fetchr:custom_hud current_player.components[5]
execute \
	if score @s fetchr.pref matches 64 \
	run function fetchr:preferences/custom_hud/add_to_col0
data \
	modify storage fetchr:custom_hud current_player.components[5] \
	set from storage fetchr:custom_hud current_player.components[6]
data \
	modify storage fetchr:custom_hud current_player.components[6] \
	set from storage fetchr:custom_hud current_player.components[7]
data \
	modify storage fetchr:custom_hud current_player.components[7] \
	set from storage fetchr:custom_hud current_player.components[8]
data \
	modify storage fetchr:custom_hud current_player.components[8] \
	set from storage fetchr:custom_hud current_player.components[9]
data \
	modify storage fetchr:custom_hud current_player.components[9] \
	set from storage fetchr:custom_hud current_player.components[10]
data modify storage fetchr:custom_hud current_player.components[10] set value { id: "fetchr:empty" }