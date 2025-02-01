#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/9_11
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/9_17

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 9 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0257"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 10 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U0256"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 11 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0255"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 9 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0257"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 10 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0256"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 11 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0255"
#NEUN_SCRIPT end
