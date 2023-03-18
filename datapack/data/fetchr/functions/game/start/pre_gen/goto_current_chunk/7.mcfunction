#> fetchr:game/start/pre_gen/goto_current_chunk/7
#
# @within function fetchr:game/start/pre_gen/goto_current_chunk/6

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 16.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 16

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..7 run function fetchr:game/start/pre_gen/goto_current_chunk/8
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 8.. positioned ~128 ~ ~ run function fetchr:game/start/pre_gen/goto_current_chunk/8