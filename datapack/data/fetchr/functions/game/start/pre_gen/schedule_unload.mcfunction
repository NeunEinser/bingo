#> fetchr:game/start/pre_gen/schedule_unload
#
# Unloads chunks after generating them
#
# @within function fetchr:game/**

scoreboard players operation $game_start/pre_gen/goto.x fetchr.tmp = $game_start/pre_gen/unload.x fetchr.tmp
scoreboard players operation $game_start/pre_gen/goto.z fetchr.tmp = $game_start/pre_gen/unload.z fetchr.tmp
scoreboard players set $game_start/pre_gen/goto.type fetchr.tmp 3
execute in fetchr:default run function fetchr:game/start/pre_gen/move_x/0

schedule function fetchr:game/start/pre_gen/schedule_unload 1t