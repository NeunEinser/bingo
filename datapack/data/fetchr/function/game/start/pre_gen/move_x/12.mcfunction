#> fetchr:game/start/pre_gen/move_x/12
#
# @within function fetchr:game/start/pre_gen/move_x/11

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 1024.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 1024

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..511 run function fetchr:game/start/pre_gen/move_x/13
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 512.. positioned ~8192 0 0 run function fetchr:game/start/pre_gen/move_x/13