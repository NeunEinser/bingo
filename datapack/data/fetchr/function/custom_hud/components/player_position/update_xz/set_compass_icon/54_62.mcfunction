#> fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/54_62
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/54_80

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches ..56 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010E"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 57..59 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010D"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 60.. \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010C"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches ..56 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u010E"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 57..59 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u010D"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 60.. \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u010C"
#NEUN_SCRIPT end
