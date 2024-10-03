#> fetchr:game/start/pre_gen/move_x/7
#
# @within function fetchr:game/start/pre_gen/move_x/6

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 32768.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 32768

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..16383 run function fetchr:game/start/pre_gen/move_x/8
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 16384.. positioned ~262144 0 0 run function fetchr:game/start/pre_gen/move_x/8