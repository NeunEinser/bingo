#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/63_65
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/63_71

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 63 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0221"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 64 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U0220"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 65 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u021F"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 63 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0221"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 64 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0220"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 65 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u021F"
#NEUN_SCRIPT end
