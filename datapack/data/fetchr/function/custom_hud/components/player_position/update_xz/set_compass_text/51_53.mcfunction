#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/51_53
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/45_53

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 51 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u022D"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 52 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U022C"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 53 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u022B"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 51 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u022D"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 52 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u022C"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 53 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u022B"
#NEUN_SCRIPT end
