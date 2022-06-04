#> bingo:preferences/custom_hud/component_settings/enable_merged_chunk_coordinates
#
# Merges chunk coordinates to the normal X/Z coordinate display, showing them
# only when the player is holding a treasure map.
#
# @within function bingo:preferences/custom_hud/show

#>
# @within function bingo:preferences/custom_hud/component_settings/*
#declare score_holder $hud/settings/merge_chunk_coord.slot
execute store result score $hud/settings/merge_chunk_coord.slot bingo.tmp run data get storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_chunk_position"}].slot_id

execute if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_chunk_position"}] if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}] run function bingo:preferences/custom_hud/component_settings/merge_to_enabled_position
execute unless data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}] run function bingo:preferences/custom_hud/component_settings/add_player_position_with_chunk_coordinates

data modify storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].custom.bingo.chunkCoordinatesOnTreasureMap set value true

scoreboard players set @s bingo.update_hud 1
scoreboard players set $preferences.next_page bingo.tmp 72