#> fetchr:game/start/pre_gen/move_x/3
#
# @within function fetchr:game/start/pre_gen/move_x/2

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 524288.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 524288

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..262143 run function fetchr:game/start/pre_gen/move_x/4
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 262144.. positioned ~4194304 0 0 run function fetchr:game/start/pre_gen/move_x/4