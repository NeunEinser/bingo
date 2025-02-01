#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/0_2
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/0_8

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 0 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0200"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 1 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U025F"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 2 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u025E"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 0 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0200"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 1 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u025F"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 2 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u025E"
#NEUN_SCRIPT end
