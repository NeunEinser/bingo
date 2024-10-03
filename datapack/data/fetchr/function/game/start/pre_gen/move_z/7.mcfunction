#> fetchr:game/start/pre_gen/move_z/7
#
# @within function fetchr:game/start/pre_gen/move_z/6

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 32768.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 32768

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..16383 run function fetchr:game/start/pre_gen/move_z/8
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 16384.. positioned ~ 0 ~262144 run function fetchr:game/start/pre_gen/move_z/8