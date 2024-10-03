#> fetchr:game/start/pre_gen/move_z/15
#
# @within function fetchr:game/start/pre_gen/move_z/14

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 128.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 128

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..63 run function fetchr:game/start/pre_gen/move_z/16
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 64.. positioned ~ 0 ~1024 run function fetchr:game/start/pre_gen/move_z/16