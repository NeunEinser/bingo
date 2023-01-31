#> fetchr:game/start/pre_gen/goto_current_chunk/21
#
# @within function fetchr:game/start/pre_gen/goto_current_chunk/20

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 2.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 2

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 0 run function fetchr:game/start/pre_gen/generate_chunk
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 1 positioned ~ ~ ~16 run function fetchr:game/start/pre_gen/generate_chunk