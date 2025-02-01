#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/3_5
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/0_8

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 3 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u025D"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 4 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U025C"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 5 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u025B"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 3 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u025D"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 4 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u025C"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 5 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u025B"
#NEUN_SCRIPT end
