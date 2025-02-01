#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/21_23
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/18_26

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 21 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u024B"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 22 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U024A"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 23 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0249"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 21 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u024B"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 22 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u024A"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 23 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0249"
#NEUN_SCRIPT end
