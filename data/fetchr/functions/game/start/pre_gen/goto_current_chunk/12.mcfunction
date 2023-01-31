#> fetchr:game/start/pre_gen/goto_current_chunk/12
#
# @within function fetchr:game/start/pre_gen/goto_current_chunk/11

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..-1 run scoreboard players add $game_start/pre_gen/goto.z fetchr.tmp 1024

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..511 run function fetchr:game/start/pre_gen/goto_current_chunk/13
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 512.. positioned ~ ~ ~8192 run function fetchr:game/start/pre_gen/goto_current_chunk/13