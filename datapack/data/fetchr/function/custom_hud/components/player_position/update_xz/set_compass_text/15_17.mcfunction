#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/15_17
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/9_17

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 15 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0251"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 16 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U0250"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 17 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u024F"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 15 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0251"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 16 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0250"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 17 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u024F"
#NEUN_SCRIPT end
