#> bingo:preferences/custom_hud/component_settings/add_player_position_with_chunk_coordinates
#
# Merges chunk coordinates to the normal X/Z coordinate display which was not
# enabled previously.
#
# @within function bingo:preferences/custom_hud/component_settings/enable_merged_chunk_coordinates

data modify storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_chunk_position"}] set from storage bingo:custom_hud components[{id: "bingo:player_chunk_position"}]
execute store result storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].slot_id byte 1 run scoreboard players get $hud/settings/merge_chunk_coord.slot bingo.tmp