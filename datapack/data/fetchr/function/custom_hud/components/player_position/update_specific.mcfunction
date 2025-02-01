#> fetchr:custom_hud/components/player_position/update_specific
#
# Updates player_position and y_coordinate components only when their values
# changed.
#
# @within function fetchr:custom_hud/components/player_position/tick
# @context entity Player whose hud is currently being updated

scoreboard players operation $custom_hud/player_pos.x fetchr.tmp = $tick/player.x fetchr.tmp
scoreboard players operation $custom_hud/player_pos.y fetchr.tmp = $tick/player.y fetchr.tmp
scoreboard players operation $custom_hud/player_pos.z fetchr.tmp = $tick/player.z fetchr.tmp
scoreboard players operation $custom_hud/player_pos.rot fetchr.tmp = $tick/player.rot fetchr.tmp

execute \
	if entity @s[predicate=fetchr:is_in_game] \
	run scoreboard players operation $custom_hud/player_pos.x fetchr.tmp -= $spawn_x fetchr.state
execute \
	if entity @s[predicate=fetchr:is_in_game] \
	run scoreboard players operation $custom_hud/player_pos.z fetchr.tmp -= $spawn_z fetchr.state

#>
# @private
#declare score_holder $custom_hud/player_pos.xz_changed
scoreboard players set $custom_hud/player_pos.xz_changed fetchr.tmp 1
execute \
	if score $tick/player.x fetchr.tmp = @s fetchr.prev_x_pos \
	if score $tick/player.z fetchr.tmp = @s fetchr.prev_z_pos \
	run scoreboard players set $custom_hud/player_pos.xz_changed fetchr.tmp 0

execute \
	if score $custom_hud/player_pos.xz_changed fetchr.tmp matches 1 \
	if data storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:player_position" }] \
	run function fetchr:custom_hud/components/player_position/update_xz
execute \
	unless score $custom_hud/player_pos.xz_changed fetchr.tmp matches 1 \
	unless score $tick/player.rot fetchr.tmp = @s fetchr.prev_rot \
	if data storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:player_position" }] \
	run function fetchr:custom_hud/components/player_position/update_xz
execute \
	if score $custom_hud/player_pos.xz_changed fetchr.tmp matches 1 \
	if data storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:player_chunk_position" }] \
	run function fetchr:custom_hud/components/player_position/update_chunk_xz

execute \
	unless score $tick/player.y fetchr.tmp = @s fetchr.prev_y_pos \
	if data storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:y_position" }] \
	run function fetchr:custom_hud/components/player_position/update_y