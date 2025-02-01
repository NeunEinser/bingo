#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/60_62
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/54_62

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 60 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0224"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 61 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U0223"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 62 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0222"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 60 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0224"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 61 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0223"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 62 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0222"
#NEUN_SCRIPT end
