#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/57_59
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/54_62

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 57 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0227"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 58 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U0226"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 59 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0225"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 57 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0227"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 58 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0226"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 59 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0225"
#NEUN_SCRIPT end
