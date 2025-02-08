#> fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/63_71
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/54_80

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches ..65 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010B"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 66..68 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010A"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 69.. \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0109"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches ..65 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u010B"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 66..68 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u010A"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 69.. \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0109"
#NEUN_SCRIPT end
