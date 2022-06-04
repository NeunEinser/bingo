#> bingo:preferences/custom_hud/component_settings/merge_to_enabled_position
#
# Merges chunk coordinates to the normal X/Z coordinate display which is already
# enabled in the current player's hud
#
# @within function bingo:preferences/custom_hud/component_settings/enable_merged_chunk_coordinates

execute if score $hud/settings/merge_chunk_coord.slot bingo.tmp matches 0 run data modify storage bingo:custom_hud currentPlayer.components[0] set from storage bingo:custom_hud currentPlayer.components[1]
execute if score $hud/settings/merge_chunk_coord.slot bingo.tmp matches 0..1 run data modify storage bingo:custom_hud currentPlayer.components[1] set from storage bingo:custom_hud currentPlayer.components[2]
execute if score $hud/settings/merge_chunk_coord.slot bingo.tmp matches 0..2 run data modify storage bingo:custom_hud currentPlayer.components[2] set from storage bingo:custom_hud currentPlayer.components[3]
execute if score $hud/settings/merge_chunk_coord.slot bingo.tmp matches 0..3 run data modify storage bingo:custom_hud currentPlayer.components[3] set from storage bingo:custom_hud currentPlayer.components[4]
execute if score $hud/settings/merge_chunk_coord.slot bingo.tmp matches 0..4 run data modify storage bingo:custom_hud currentPlayer.components[4] set value {id: "bingo:empty", padding: '{"translate": "space.91"}', slot_id: 4b}

execute if score $hud/settings/merge_chunk_coord.slot bingo.tmp matches 5 run data modify storage bingo:custom_hud currentPlayer.components[5] set from storage bingo:custom_hud currentPlayer.components[6]
execute if score $hud/settings/merge_chunk_coord.slot bingo.tmp matches 5..6 run data modify storage bingo:custom_hud currentPlayer.components[6] set from storage bingo:custom_hud currentPlayer.components[7]
execute if score $hud/settings/merge_chunk_coord.slot bingo.tmp matches 5..7 run data modify storage bingo:custom_hud currentPlayer.components[7] set from storage bingo:custom_hud currentPlayer.components[8]
execute if score $hud/settings/merge_chunk_coord.slot bingo.tmp matches 5..8 run data modify storage bingo:custom_hud currentPlayer.components[8] set from storage bingo:custom_hud currentPlayer.components[9]
execute if score $hud/settings/merge_chunk_coord.slot bingo.tmp matches 5..9 run data modify storage bingo:custom_hud currentPlayer.components[9] set from storage bingo:custom_hud currentPlayer.components[10]
execute if score $hud/settings/merge_chunk_coord.slot bingo.tmp matches 5..10 run data modify storage bingo:custom_hud currentPlayer.components[10] set value {id: "bingo:empty", padding: '{"translate": "space.91"}', slot_id: 10b}

data modify storage bingo:custom_hud currentPlayer.components[0].slot_id set value 0b
data modify storage bingo:custom_hud currentPlayer.components[1].slot_id set value 1b
data modify storage bingo:custom_hud currentPlayer.components[2].slot_id set value 2b
data modify storage bingo:custom_hud currentPlayer.components[3].slot_id set value 3b
data modify storage bingo:custom_hud currentPlayer.components[5].slot_id set value 5b
data modify storage bingo:custom_hud currentPlayer.components[6].slot_id set value 6b
data modify storage bingo:custom_hud currentPlayer.components[7].slot_id set value 7b
data modify storage bingo:custom_hud currentPlayer.components[8].slot_id set value 8b
data modify storage bingo:custom_hud currentPlayer.components[9].slot_id set value 9b