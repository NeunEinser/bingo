#> bingo:custom_hud/components/player_position/update
#
# Updates player_position and y_coordinate components if they are enabled.
#
# @within function bingo:custom_hud/components/player_position/tick
# @context entity Player whose hud is currently being updated

scoreboard players operation @s bingo.pos_hash = $custom_hud/player_pos.hash bingo.tmp
execute if entity @s[predicate=bingo:is_in_game] run scoreboard players operation $custom_hud/player_pos.x bingo.tmp -= $spawn_x bingo.state
execute if entity @s[predicate=bingo:is_in_game] run scoreboard players operation $custom_hud/player_pos.z bingo.tmp -= $spawn_z bingo.state

execute if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}] run function bingo:custom_hud/components/player_position/update_xz
execute if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_chunk_position"}] run function bingo:custom_hud/components/player_position/update_chunk_xz
execute if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:y_position"}] run function bingo:custom_hud/components/player_position/update_y