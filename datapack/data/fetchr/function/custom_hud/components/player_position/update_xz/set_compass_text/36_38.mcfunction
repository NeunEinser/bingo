#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/36_38
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/36_44

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 36 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u023C"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 37 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U023B"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 38 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u023A"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 36 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u023C"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 37 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u023B"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 38 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u023A"
#NEUN_SCRIPT end
