#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/69_71
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/63_71

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 69 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u021B"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 70 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u021A"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 71 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0219"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 69 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u021B"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 70 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u021A"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 71 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0219"
#NEUN_SCRIPT end
