#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/84_86
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/81_89

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 84 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u020C"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 85 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u020B"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 86 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u020A"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 84 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u020C"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 85 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u020B"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 86 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u020A"
#NEUN_SCRIPT end
