#> fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/81_89
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/81_95

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches ..83 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0105"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 84..86 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U0104"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 87.. \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0103"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches ..83 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0105"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 84..86 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0104"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 87.. \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0103"
#NEUN_SCRIPT end
