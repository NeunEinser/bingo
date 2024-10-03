#> fetchr:game/start/pre_gen/move_z/20
#
# @within function fetchr:game/start/pre_gen/move_z/19

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 4.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 4

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..1 run function fetchr:game/start/pre_gen/move_z/21
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 2.. positioned ~ 0 ~32 run function fetchr:game/start/pre_gen/move_z/21