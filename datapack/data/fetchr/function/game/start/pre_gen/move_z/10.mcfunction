#> fetchr:game/start/pre_gen/move_z/10
#
# @within function fetchr:game/start/pre_gen/move_z/9

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 4096.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 4096

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..2047 run function fetchr:game/start/pre_gen/move_z/11
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 2048.. positioned ~ 0 ~32768 run function fetchr:game/start/pre_gen/move_z/11