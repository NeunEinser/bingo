#> bingo:custom_hud/components/player_position/update_specific
#
# Updates player_position and y_coordinate components only when their values
# changed.
#
# @within function bingo:custom_hud/components/player_position/tick
# @context entity Player whose hud is currently being updated

scoreboard players operation $custom_hud/player_pos.x bingo.tmp = $tick/player.x bingo.tmp
scoreboard players operation $custom_hud/player_pos.y bingo.tmp = $tick/player.y bingo.tmp
scoreboard players operation $custom_hud/player_pos.z bingo.tmp = $tick/player.z bingo.tmp
scoreboard players operation $custom_hud/player_pos.rot bingo.tmp = $tick/player.rot bingo.tmp

execute if entity @s[predicate=bingo:is_in_game] run scoreboard players operation $custom_hud/player_pos.x bingo.tmp -= $spawn_x bingo.state
execute if entity @s[predicate=bingo:is_in_game] run scoreboard players operation $custom_hud/player_pos.z bingo.tmp -= $spawn_z bingo.state

#>
# @private
#declare score_holder $custom_hud/player_pos.xz_changed
scoreboard players set $custom_hud/player_pos.xz_changed bingo.tmp 1
execute if score $tick/player.x bingo.tmp = @s bingo.prev_x_pos if score $tick/player.z bingo.tmp = @s bingo.prev_z_pos run scoreboard players set $custom_hud/player_pos.xz_changed bingo.tmp 0

execute if score $custom_hud/player_pos.xz_changed bingo.tmp matches 1 if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}] run function bingo:custom_hud/components/player_position/update_xz
execute unless score $custom_hud/player_pos.xz_changed bingo.tmp matches 1 unless score $tick/player.rot bingo.tmp = @s bingo.prev_rot if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}] run function bingo:custom_hud/components/player_position/update_xz
execute if score $custom_hud/player_pos.xz_changed bingo.tmp matches 1 if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_chunk_position"}] run function bingo:custom_hud/components/player_position/update_chunk_xz

execute unless score $tick/player.y bingo.tmp = @s bingo.prev_y_pos if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:y_position"}] run function bingo:custom_hud/components/player_position/update_y