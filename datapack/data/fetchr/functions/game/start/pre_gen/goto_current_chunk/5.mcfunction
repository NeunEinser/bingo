#> fetchr:game/start/pre_gen/goto_current_chunk/5
#
# @within function fetchr:game/start/pre_gen/goto_current_chunk/4

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 64.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 64

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..31 run function fetchr:game/start/pre_gen/goto_current_chunk/6
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 32.. positioned ~512 ~ ~ run function fetchr:game/start/pre_gen/goto_current_chunk/6