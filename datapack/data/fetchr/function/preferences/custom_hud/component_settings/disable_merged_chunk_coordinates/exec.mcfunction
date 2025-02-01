#> fetchr:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/exec
#
# Disables the merged chunk coordinates in the player position component
#
# @within function fetchr:preferences/custom_hud/show

data \
	modify \
		storage fetchr:custom_hud \
		currentPlayer\
		.components[{ id: "fetchr:player_position" }]\
		.custom\
		.fetchr\
		.chunkCoordinatesOnTreasureMap \
	set value false

#>
# @within function fetchr:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/*
#declare score_holder $hud/settings/disable_chunk_coord.slot
execute \
	store result score $hud/settings/disable_chunk_coord.slot fetchr.tmp \
	run data get storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:player_position" }].slot_id

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data \
	modify storage tmp.fetchr:preferences/hud component \
	set from storage fetchr:custom_hud currentPlayer.components[4]

execute \
	if score $hud/settings/disable_chunk_coord.slot fetchr.tmp matches 0..3 \
	if data storage tmp.fetchr:preferences/hud component{ id: "fetchr:empty" } \
	run function fetchr:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/add_to_col0_below_position
execute \
	if score $hud/settings/disable_chunk_coord.slot fetchr.tmp matches 0..4 \
	unless data storage tmp.fetchr:preferences/hud component{ id: "fetchr:empty" } \
	run function fetchr:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/add_to_col1


data \
	modify storage tmp.fetchr:preferences/hud component \
	set from storage fetchr:custom_hud currentPlayer.components[10]
execute \
	if score $hud/settings/disable_chunk_coord.slot fetchr.tmp matches 5..9 \
	if data storage tmp.fetchr:preferences/hud component{ id: "fetchr:empty" } \
	run function fetchr:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/add_to_col1_below_position
execute \
	if score $hud/settings/disable_chunk_coord.slot fetchr.tmp matches 5..10 \
	unless data storage tmp.fetchr:preferences/hud component{ id: "fetchr:empty" } \
	run function fetchr:preferences/custom_hud/component_settings/disable_merged_chunk_coordinates/add_to_col0

scoreboard players set @s fetchr.update_hud 1
data modify storage fetchr:custom_hud currentPlayer.components[0].slot_id set value 0b
data modify storage fetchr:custom_hud currentPlayer.components[1].slot_id set value 1b
data modify storage fetchr:custom_hud currentPlayer.components[2].slot_id set value 2b
data modify storage fetchr:custom_hud currentPlayer.components[3].slot_id set value 3b
data modify storage fetchr:custom_hud currentPlayer.components[5].slot_id set value 5b
data modify storage fetchr:custom_hud currentPlayer.components[6].slot_id set value 6b
data modify storage fetchr:custom_hud currentPlayer.components[7].slot_id set value 7b
data modify storage fetchr:custom_hud currentPlayer.components[8].slot_id set value 8b
data modify storage fetchr:custom_hud currentPlayer.components[9].slot_id set value 9b

scoreboard players set $preferences.next_page fetchr.tmp 72