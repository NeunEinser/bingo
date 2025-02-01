#> fetchr:preferences/custom_hud/component_settings/enable_merged_chunk_coordinates
#
# Merges chunk coordinates to the normal X/Z coordinate display, showing them
# only when the player is holding a treasure map.
#
# @within function fetchr:preferences/custom_hud/show

#>
# @within function fetchr:preferences/custom_hud/component_settings/*
#declare score_holder $hud/settings/merge_chunk_coord.slot
execute \
	store result score $hud/settings/merge_chunk_coord.slot fetchr.tmp \
	run data get \
		storage fetchr:custom_hud \
		currentPlayer.components[{ id: "fetchr:player_chunk_position" }].slot_id

execute \
	if data storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:player_chunk_position" }] \
	if data storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:player_position" }] \
	run function fetchr:preferences/custom_hud/component_settings/merge_to_enabled_position
execute \
	unless data storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:player_position" }] \
	run function fetchr:preferences/custom_hud/component_settings/add_player_position_with_chunk_coordinates

data \
	modify \
		storage fetchr:custom_hud \
		currentPlayer\
		.components[{ id: "fetchr:player_position" }]\
		.custom\
		.fetchr\
		.chunkCoordinatesOnTreasureMap \
	set value true

scoreboard players set @s fetchr.update_hud 1
scoreboard players set $preferences.next_page fetchr.tmp 72