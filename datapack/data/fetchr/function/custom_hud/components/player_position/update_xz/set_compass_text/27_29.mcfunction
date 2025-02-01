#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/27_29
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/27_35

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 27 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0245"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 28 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U0244"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 29 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0243"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 27 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0245"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 28 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0244"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 29 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0243"
#NEUN_SCRIPT end
