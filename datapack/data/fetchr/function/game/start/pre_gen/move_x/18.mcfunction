#> fetchr:game/start/pre_gen/move_x/18
#
# @within function fetchr:game/start/pre_gen/move_x/17

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 16.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 16

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..7 run function fetchr:game/start/pre_gen/move_x/19
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 8.. positioned ~128 0 0 run function fetchr:game/start/pre_gen/move_x/19