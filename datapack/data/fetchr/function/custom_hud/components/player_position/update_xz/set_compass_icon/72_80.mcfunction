#> fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/72_80
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/54_80

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches ..74 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0108"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 75..77 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U0107"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 78.. \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0106"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches ..74 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0108"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 75..77 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0107"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 78.. \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0106"
#NEUN_SCRIPT end
