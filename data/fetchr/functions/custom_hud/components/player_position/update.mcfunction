#> fetchr:custom_hud/components/player_position/update
#
# Updates player_position and y_coordinate components if they are enabled.
#
# @within function fetchr:custom_hud/components/player_position/tick
# @context entity Player whose hud is currently being updated

scoreboard players operation @s fetchr.pos_hash = $custom_hud/player_pos.hash fetchr.tmp
execute if entity @s[predicate=fetchr:is_in_game] run scoreboard players operation $custom_hud/player_pos.x fetchr.tmp -= $spawn_x fetchr.state
execute if entity @s[predicate=fetchr:is_in_game] run scoreboard players operation $custom_hud/player_pos.z fetchr.tmp -= $spawn_z fetchr.state

execute if data storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:player_position"}] run function fetchr:custom_hud/components/player_position/update_xz
execute if data storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:player_chunk_position"}] run function fetchr:custom_hud/components/player_position/update_chunk_xz
execute if data storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:y_position"}] run function fetchr:custom_hud/components/player_position/update_y