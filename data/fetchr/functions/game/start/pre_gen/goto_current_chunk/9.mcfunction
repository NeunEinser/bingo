#> fetchr:game/start/pre_gen/goto_current_chunk/9
#
# @within function fetchr:game/start/pre_gen/goto_current_chunk/8

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 4.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 4

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..1 run function fetchr:game/start/pre_gen/goto_current_chunk/10
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 2.. positioned ~32 ~ ~ run function fetchr:game/start/pre_gen/goto_current_chunk/10