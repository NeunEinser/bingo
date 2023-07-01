#> fetchr:game/start/pre_gen/move_x/14
#
# @within function fetchr:game/start/pre_gen/move_x/13

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 256.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 256

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..127 run function fetchr:game/start/pre_gen/move_x/15
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 128.. positioned ~2048 0 0 run function fetchr:game/start/pre_gen/move_x/15