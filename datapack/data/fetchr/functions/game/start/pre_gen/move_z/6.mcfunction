#> fetchr:game/start/pre_gen/move_z/6
#
# @within function fetchr:game/start/pre_gen/move_z/5

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 65536.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 65536

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..32767 run function fetchr:game/start/pre_gen/move_z/7
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 32768.. positioned ~ 0 ~524288 run function fetchr:game/start/pre_gen/move_z/7