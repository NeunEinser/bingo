#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/54_56
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/54_62

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 54 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u022A"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 55 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0229"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 56 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0228"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 54 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u022A"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 55 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0229"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 56 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0228"
#NEUN_SCRIPT end
