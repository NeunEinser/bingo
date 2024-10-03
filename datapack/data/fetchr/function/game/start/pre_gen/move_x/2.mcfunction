#> fetchr:game/start/pre_gen/move_x/2
#
# @within function fetchr:game/start/pre_gen/move_x/1

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 1048576.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 1048576

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..524287 run function fetchr:game/start/pre_gen/move_x/3
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 524288.. positioned ~8388608 0 0 run function fetchr:game/start/pre_gen/move_x/3