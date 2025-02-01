#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/12_14
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/9_17

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 12 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0254"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 13 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U0253"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 14 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0252"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 12 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0254"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 13 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0253"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 14 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0252"
#NEUN_SCRIPT end
