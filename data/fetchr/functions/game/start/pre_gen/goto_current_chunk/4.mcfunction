#> fetchr:game/start/pre_gen/goto_current_chunk/4
#
# @within function fetchr:game/start/pre_gen/goto_current_chunk/3

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 128.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 128

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..63 run function fetchr:game/start/pre_gen/goto_current_chunk/5
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 64.. positioned ~1024 ~ ~ run function fetchr:game/start/pre_gen/goto_current_chunk/5