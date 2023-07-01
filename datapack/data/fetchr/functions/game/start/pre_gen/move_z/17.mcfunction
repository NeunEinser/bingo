#> fetchr:game/start/pre_gen/move_z/17
#
# @within function fetchr:game/start/pre_gen/move_z/16

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 32.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 32

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..15 run function fetchr:game/start/pre_gen/move_z/18
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 16.. positioned ~ 0 ~256 run function fetchr:game/start/pre_gen/move_z/18