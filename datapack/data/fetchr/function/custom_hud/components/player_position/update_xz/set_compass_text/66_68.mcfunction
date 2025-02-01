#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/66_68
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/63_71

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 66 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u021E"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 67 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U021D"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 68 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u021C"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 66 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u021E"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 67 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u021D"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 68 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u021C"
#NEUN_SCRIPT end
