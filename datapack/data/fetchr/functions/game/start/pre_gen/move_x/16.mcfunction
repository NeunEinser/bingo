#> fetchr:game/start/pre_gen/move_x/16
#
# @within function fetchr:game/start/pre_gen/move_x/15

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 64.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 64

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..31 run function fetchr:game/start/pre_gen/move_x/17
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 32.. positioned ~512 0 0 run function fetchr:game/start/pre_gen/move_x/17