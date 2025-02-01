#> fetchr:preferences/custom_hud/component_settings/add_player_position_with_chunk_coordinates
#
# Merges chunk coordinates to the normal X/Z coordinate display which was not
# enabled previously.
#
# @within function fetchr:preferences/custom_hud/component_settings/enable_merged_chunk_coordinates

data \
	modify storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:player_chunk_position" }] \
	set from storage fetchr:custom_hud components[{ id: "fetchr:player_chunk_position" }]
execute \
	store result \
		storage fetchr:custom_hud \
		currentPlayer.components[{ id: "fetchr:player_position" }].slot_id \
		byte 1 \
	run scoreboard players get $hud/settings/merge_chunk_coord.slot fetchr.tmp