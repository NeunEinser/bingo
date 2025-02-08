#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/78_80
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/72_80

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 78 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0212"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 79 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0211"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 80 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0210"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 78 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0212"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 79 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0211"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 80 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0210"
#NEUN_SCRIPT end
