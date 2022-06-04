#> bingo:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/exec
#
# Disables the merged chunk coordinates in the player position component
#
# @within function bingo:preferences/custom_hud/show

data modify storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].custom.bingo.chunkCoordinatesOnTreasureMap set value false

#>
# @within function bingo:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/*
#declare score_holder $hud/settings/disable_chunk_coord.slot
execute store result score $hud/settings/disable_chunk_coord.slot bingo.tmp run data get storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].slot_id

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.bingo:preferences/hud component set from storage bingo:custom_hud currentPlayer.components[4]

execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 0..3 if data storage tmp.bingo:preferences/hud component{id: "bingo:empty"} run function bingo:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/add_to_col0_below_position
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 0..4 unless data storage tmp.bingo:preferences/hud component{id: "bingo:empty"} run function bingo:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/add_to_col1


data modify storage tmp.bingo:preferences/hud component set from storage bingo:custom_hud currentPlayer.components[10]
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 5..9 if data storage tmp.bingo:preferences/hud component{id: "bingo:empty"} run function bingo:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/add_to_col1_below_position
execute if score $hud/settings/disable_chunk_coord.slot bingo.tmp matches 5..10 unless data storage tmp.bingo:preferences/hud component{id: "bingo:empty"} run function bingo:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/add_to_col0

scoreboard players set @s bingo.update_hud 1
data modify storage bingo:custom_hud currentPlayer.components[0].slot_id set value 0b
data modify storage bingo:custom_hud currentPlayer.components[1].slot_id set value 1b
data modify storage bingo:custom_hud currentPlayer.components[2].slot_id set value 2b
data modify storage bingo:custom_hud currentPlayer.components[3].slot_id set value 3b
data modify storage bingo:custom_hud currentPlayer.components[5].slot_id set value 5b
data modify storage bingo:custom_hud currentPlayer.components[6].slot_id set value 6b
data modify storage bingo:custom_hud currentPlayer.components[7].slot_id set value 7b
data modify storage bingo:custom_hud currentPlayer.components[8].slot_id set value 8b
data modify storage bingo:custom_hud currentPlayer.components[9].slot_id set value 9b

scoreboard players set $preferences.next_page bingo.tmp 72