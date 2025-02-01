#> fetchr:preferences/custom_hud/filter_disabled
#
# Filters disabled components before showing them to the player
#
# @within tag/function fetchr:preferences/custom_hud/filter_disabled
# @handles #fetchr:preferences/custom_hud/filter_disabled

execute \
	if data \
		storage fetchr:custom_hud \
		currentPlayer\
		.components[{ id: "fetchr:player_position" }]\
		.custom\
		.fetchr{ chunkCoordinatesOnTreasureMap: true } \
	run data remove storage io.fetchr:preferences components[{ id: "fetchr:player_chunk_position" }]