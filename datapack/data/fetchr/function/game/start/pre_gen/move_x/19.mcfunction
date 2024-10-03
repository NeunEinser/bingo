#> fetchr:game/start/pre_gen/move_x/19
#
# @within function fetchr:game/start/pre_gen/move_x/18

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 8.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 8

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..3 run function fetchr:game/start/pre_gen/move_x/20
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 4.. positioned ~64 0 0 run function fetchr:game/start/pre_gen/move_x/20