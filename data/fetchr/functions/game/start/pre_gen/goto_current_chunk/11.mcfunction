#> fetchr:game/start/pre_gen/goto_current_chunk/11
#
# @within function fetchr:game/start/pre_gen/goto_current_chunk/10

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 0.. run function fetchr:game/start/pre_gen/goto_current_chunk/12
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..-1 positioned ~ ~ ~-16384 run function fetchr:game/start/pre_gen/goto_current_chunk/12