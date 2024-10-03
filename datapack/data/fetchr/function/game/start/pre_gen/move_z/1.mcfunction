#> fetchr:game/start/pre_gen/move_z/1
#
# @within function fetchr:game/start/pre_gen/move_z/0

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..-1 run scoreboard players add $game_start/pre_gen/goto.z fetchr.tmp 2097152

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..1048575 run function fetchr:game/start/pre_gen/move_z/2
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 1048576.. positioned ~ 0 ~16777216 run function fetchr:game/start/pre_gen/move_z/2