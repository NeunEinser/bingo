#> fetchr:custom_hud/components/player_position/update_xz/set_compass_icon
#
# This function sets the compass icon for the component
#
# @within function fetchr:custom_hud/components/player_position/update_xz
# @context entity Player whose hud is currently being updated

#NEUN_SCRIPT until 65
#data modify storage io.fetchr:custom_hud component.iconWidth set value '"\\u000a"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data modify storage io.fetchr:custom_hud component.iconWidth set value "\u000a"
#NEUN_SCRIPT end

execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 0..80 \
	run function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/0_80
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 81..95 \
	run function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/81_95