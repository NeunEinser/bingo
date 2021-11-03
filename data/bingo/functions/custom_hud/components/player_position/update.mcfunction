#> bingo:custom_hud/components/player_position/update
#
# Updates player_position and y_coordinate components if they are enabled.
#
# @within function bingo:custom_hud/components/player_position/tick
# @context entity Player whose hud is currently being updated

execute if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}] run function bingo:custom_hud/components/player_position/update_x_z
execute if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:y_position"}] run function bingo:custom_hud/components/player_position/update_y