#> fetchr:game/start/pre_gen/goto_current_chunk/2
#
# @within function fetchr:game/start/pre_gen/goto_current_chunk/1

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 512.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 512

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..255 run function fetchr:game/start/pre_gen/goto_current_chunk/3
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 256.. positioned ~4096 ~ ~ run function fetchr:game/start/pre_gen/goto_current_chunk/3