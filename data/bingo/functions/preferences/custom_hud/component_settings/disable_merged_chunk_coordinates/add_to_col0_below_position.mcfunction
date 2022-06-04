#> bingo:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/add_to_col0_below_position
#
# Attempts to adds the chunk coordinate to col 0 below the position
#
# @within function bingo:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/exec

execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 0..3 run data modify storage bingo:custom_hud currentPlayer.components[4] set from storage bingo:custom_hud currentPlayer.components[3]
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 0..2 run data modify storage bingo:custom_hud currentPlayer.components[3] set from storage bingo:custom_hud currentPlayer.components[2]
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 0..1 run data modify storage bingo:custom_hud currentPlayer.components[2] set from storage bingo:custom_hud currentPlayer.components[1]
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 0 run data modify storage bingo:custom_hud currentPlayer.components[1] set from storage bingo:custom_hud currentPlayer.components[0]

execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 3 run data modify storage bingo:custom_hud currentPlayer.components[3] set from storage bingo:custom_hud components[{id: "bingo:player_chunk_position"}]
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 2 run data modify storage bingo:custom_hud currentPlayer.components[2] set from storage bingo:custom_hud components[{id: "bingo:player_chunk_position"}]
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 1 run data modify storage bingo:custom_hud currentPlayer.components[1] set from storage bingo:custom_hud components[{id: "bingo:player_chunk_position"}]
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 0 run data modify storage bingo:custom_hud currentPlayer.components[0] set from storage bingo:custom_hud components[{id: "bingo:player_chunk_position"}]