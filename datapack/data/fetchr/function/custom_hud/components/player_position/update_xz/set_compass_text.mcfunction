#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text
#
# This function sets the compass text icon for the component
#
# @within function fetchr:custom_hud/components/player_position/update_xz
# @context entity Player whose hud is currently being updated

scoreboard players remove $custom_hud/width.padding fetchr.io 4
#NEUN_SCRIPT until 65
#data modify storage io.fetchr:custom_hud component.iconWidth set value '"\\u000e"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data modify storage io.fetchr:custom_hud component.iconWidth set value "\u000e"
#NEUN_SCRIPT end

execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 0..80 \
	run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/0_80
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 81..95 \
	run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/81_95