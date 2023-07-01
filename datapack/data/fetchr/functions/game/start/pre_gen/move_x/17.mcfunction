#> fetchr:game/start/pre_gen/move_x/17
#
# @within function fetchr:game/start/pre_gen/move_x/16

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 32.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 32

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..15 run function fetchr:game/start/pre_gen/move_x/18
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 16.. positioned ~256 0 0 run function fetchr:game/start/pre_gen/move_x/18