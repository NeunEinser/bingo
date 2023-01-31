#> fetchr:game/start/pre_gen/goto_current_chunk/1
#
# @within function fetchr:game/start/pre_gen/goto_current_chunk

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..-1 run scoreboard players add $game_start/pre_gen/goto.x fetchr.tmp 1024

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..511 run function fetchr:game/start/pre_gen/goto_current_chunk/2
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 512.. positioned ~8192 ~ ~ run function fetchr:game/start/pre_gen/goto_current_chunk/2