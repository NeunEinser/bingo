#> fetchr:game/start/pre_gen/move_x/13
#
# @within function fetchr:game/start/pre_gen/move_x/12

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 512.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 512

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..255 run function fetchr:game/start/pre_gen/move_x/14
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 256.. positioned ~4096 0 0 run function fetchr:game/start/pre_gen/move_x/14