#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/6_8
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/0_8

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 6 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u025A"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 7 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0259"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 8 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0258"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 6 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u025A"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 7 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0259"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 8 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0258"
#NEUN_SCRIPT end
