#> fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/27_35
#
# Command Tree
#
# @within function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon/27_53

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches ..29 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0117"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 30..32 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U0116"'
#execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 33.. \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0115"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches ..29 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0117"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 30..32 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0116"
execute \
	if score $custom_hud/player_pos.rot fetchr.tmp matches 33.. \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0115"
#NEUN_SCRIPT end
