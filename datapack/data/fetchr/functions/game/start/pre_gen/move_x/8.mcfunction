#> fetchr:game/start/pre_gen/move_x/8
#
# @within function fetchr:game/start/pre_gen/move_x/7

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 16384.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 16384

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..8191 run function fetchr:game/start/pre_gen/move_x/9
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 8192.. positioned ~131072 0 0 run function fetchr:game/start/pre_gen/move_x/9