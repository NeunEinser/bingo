#> fetchr:game/start/pre_gen/goto_current_chunk/6
#
# @within function fetchr:game/start/pre_gen/goto_current_chunk/5

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 32.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 32

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..15 run function fetchr:game/start/pre_gen/goto_current_chunk/7
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 16.. positioned ~256 ~ ~ run function fetchr:game/start/pre_gen/goto_current_chunk/7