#> fetchr:game/start/pre_gen/goto_current_chunk/8
#
# @within function fetchr:game/start/pre_gen/goto_current_chunk/7

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 8.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 8

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..3 run function fetchr:game/start/pre_gen/goto_current_chunk/9
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 4.. positioned ~64 ~ ~ run function fetchr:game/start/pre_gen/goto_current_chunk/9