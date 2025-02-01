#> fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/45_53
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/27_53

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches ..47 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0111"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 48..50 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U0110"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 51.. \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u010F"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches ..47 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0111"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 48..50 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0110"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 51.. \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u010F"
#NEUN_SCRIPT end
