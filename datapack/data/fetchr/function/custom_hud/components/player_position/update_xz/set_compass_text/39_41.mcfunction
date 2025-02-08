#> fetchr:custom_hud/components/player_position/update_xz/set_compass_text/39_41
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_text/36_44

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 39 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0239"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 40 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0238"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 41 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0237"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 39 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0239"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 40 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0238"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 41 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0237"
#NEUN_SCRIPT end
