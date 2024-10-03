#> fetchr:game/start/pre_gen/move_z/8
#
# @within function fetchr:game/start/pre_gen/move_z/7

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 16384.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 16384

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..8191 run function fetchr:game/start/pre_gen/move_z/9
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 8192.. positioned ~ 0 ~131072 run function fetchr:game/start/pre_gen/move_z/9