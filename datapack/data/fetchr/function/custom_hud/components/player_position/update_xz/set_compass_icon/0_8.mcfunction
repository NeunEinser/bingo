#> fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/0_8
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/0_26

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches ..2 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0100"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 3..5 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011F"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 6.. \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u011E"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches ..2 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0100"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 3..5 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u011F"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 6.. \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u011E"
#NEUN_SCRIPT end