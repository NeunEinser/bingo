#> bingo:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/add_to_col1_below_position
#
# Attempts to adds the chunk coordinate to col 1
#
# @within function bingo:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/exec

execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 5..9 run data modify storage bingo:custom_hud currentPlayer.components[10] set from storage bingo:custom_hud currentPlayer.components[9]
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 5..8 run data modify storage bingo:custom_hud currentPlayer.components[9] set from storage bingo:custom_hud currentPlayer.components[8]
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 5..7 run data modify storage bingo:custom_hud currentPlayer.components[8] set from storage bingo:custom_hud currentPlayer.components[7]
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 5..6 run data modify storage bingo:custom_hud currentPlayer.components[7] set from storage bingo:custom_hud currentPlayer.components[6]
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 5 run data modify storage bingo:custom_hud currentPlayer.components[6] set from storage bingo:custom_hud currentPlayer.components[5]

execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 9 run data modify storage bingo:custom_hud currentPlayer.components[9] set from storage bingo:custom_hud components[{id: "bingo:player_chunk_position"}]
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 8 run data modify storage bingo:custom_hud currentPlayer.components[8] set from storage bingo:custom_hud components[{id: "bingo:player_chunk_position"}]
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 7 run data modify storage bingo:custom_hud currentPlayer.components[7] set from storage bingo:custom_hud components[{id: "bingo:player_chunk_position"}]
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 6 run data modify storage bingo:custom_hud currentPlayer.components[6] set from storage bingo:custom_hud components[{id: "bingo:player_chunk_position"}]
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 5 run data modify storage bingo:custom_hud currentPlayer.components[5] set from storage bingo:custom_hud components[{id: "bingo:player_chunk_position"}]