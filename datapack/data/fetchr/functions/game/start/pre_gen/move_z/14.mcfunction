#> fetchr:game/start/pre_gen/move_z/14
#
# @within function fetchr:game/start/pre_gen/move_z/13

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 256.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 256

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..127 run function fetchr:game/start/pre_gen/move_z/15
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 128.. positioned ~ 0 ~2048 run function fetchr:game/start/pre_gen/move_z/15