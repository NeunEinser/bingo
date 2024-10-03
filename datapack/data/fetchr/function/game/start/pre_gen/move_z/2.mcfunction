#> fetchr:game/start/pre_gen/move_z/2
#
# @within function fetchr:game/start/pre_gen/move_z/1

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 1048576.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 1048576

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..524287 run function fetchr:game/start/pre_gen/move_z/3
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 524288.. positioned ~ 0 ~8388608 run function fetchr:game/start/pre_gen/move_z/3