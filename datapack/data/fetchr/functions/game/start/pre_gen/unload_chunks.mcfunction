#> fetchr:game/start/pre_gen/unload_chunks
#
# Unloads chunks after generating them
#
# @within function fetchr:game/start/pre_gen/tick

scoreboard players operation $game_start/pre_gen/goto.x fetchr.tmp = $game_start/pre_gen/unload.x fetchr.tmp
scoreboard players operation $game_start/pre_gen/goto.z fetchr.tmp = $game_start/pre_gen/unload.z fetchr.tmp
scoreboard players set $game_start/pre_gen/goto.type fetchr.tmp 3
function fetchr:game/start/pre_gen/move_x/0