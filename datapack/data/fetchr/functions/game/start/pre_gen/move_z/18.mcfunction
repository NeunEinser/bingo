#> fetchr:game/start/pre_gen/move_z/18
#
# @within function fetchr:game/start/pre_gen/move_z/17

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 16.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 16

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..7 run function fetchr:game/start/pre_gen/move_z/19
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 8.. positioned ~ 0 ~128 run function fetchr:game/start/pre_gen/move_z/19