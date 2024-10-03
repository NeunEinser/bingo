#> fetchr:game/start/pre_gen/move_x/21
#
# @within function fetchr:game/start/pre_gen/move_x/20

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 2.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 2

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 0 run function fetchr:game/start/pre_gen/move_z/0
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 1 positioned ~16 0 0 run function fetchr:game/start/pre_gen/move_z/0