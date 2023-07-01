#> fetchr:game/start/pre_gen/move_z/13
#
# @within function fetchr:game/start/pre_gen/move_z/12

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 512.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 512

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..255 run function fetchr:game/start/pre_gen/move_z/14
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 256.. positioned ~ 0 ~4096 run function fetchr:game/start/pre_gen/move_z/14