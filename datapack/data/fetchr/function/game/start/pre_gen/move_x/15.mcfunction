#> fetchr:game/start/pre_gen/move_x/15
#
# @within function fetchr:game/start/pre_gen/move_x/14

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 128.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 128

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..63 run function fetchr:game/start/pre_gen/move_x/16
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 64.. positioned ~1024 0 0 run function fetchr:game/start/pre_gen/move_x/16