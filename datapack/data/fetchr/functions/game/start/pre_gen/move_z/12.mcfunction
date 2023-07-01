#> fetchr:game/start/pre_gen/move_z/12
#
# @within function fetchr:game/start/pre_gen/move_z/11

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 1024.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 1024

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..511 run function fetchr:game/start/pre_gen/move_z/13
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 512.. positioned ~ 0 ~8192 run function fetchr:game/start/pre_gen/move_z/13