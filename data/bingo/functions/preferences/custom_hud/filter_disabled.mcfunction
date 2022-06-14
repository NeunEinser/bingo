#> bingo:preferences/custom_hud/filter_disabled
#
# Filters disabled components before showing them to the player
#
# @within tag/function bingo:preferences/custom_hud/filter_disabled
# @handles #bingo:preferences/custom_hud/filter_disabled

execute if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].custom.bingo{chunkCoordinatesOnTreasureMap: true} run data remove storage io.bingo:preferences components[{id: "bingo:player_chunk_position"}]