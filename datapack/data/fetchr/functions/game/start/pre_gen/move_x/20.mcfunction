#> fetchr:game/start/pre_gen/move_x/20
#
# @within function fetchr:game/start/pre_gen/move_x/19

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 4.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 4

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..1 run function fetchr:game/start/pre_gen/move_x/21
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 2.. positioned ~32 0 0 run function fetchr:game/start/pre_gen/move_x/21