#> fetchr:game/start/pre_gen/move_x/6
#
# @within function fetchr:game/start/pre_gen/move_x/5

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 65536.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 65536

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..32767 run function fetchr:game/start/pre_gen/move_x/7
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 32768.. positioned ~524288 0 0 run function fetchr:game/start/pre_gen/move_x/7