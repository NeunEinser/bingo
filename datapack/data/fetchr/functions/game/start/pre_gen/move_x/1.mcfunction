#> fetchr:game/start/pre_gen/move_x/1
#
# @within function fetchr:game/start/pre_gen/move_x/0

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..-1 run scoreboard players add $game_start/pre_gen/goto.x fetchr.tmp 2097152

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..1048575 run function fetchr:game/start/pre_gen/move_x/2
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 1048576.. positioned ~16777216 0 0 run function fetchr:game/start/pre_gen/move_x/2