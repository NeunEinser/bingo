#> fetchr:game/start/pre_gen/move_z/3
#
# @within function fetchr:game/start/pre_gen/move_z/2

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 524288.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 524288

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..262143 run function fetchr:game/start/pre_gen/move_z/4
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 262144.. positioned ~ 0 ~4194304 run function fetchr:game/start/pre_gen/move_z/4