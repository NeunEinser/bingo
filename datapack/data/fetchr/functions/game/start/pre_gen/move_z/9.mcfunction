#> fetchr:game/start/pre_gen/move_z/9
#
# @within function fetchr:game/start/pre_gen/move_z/8

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 8192.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 8192

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..4095 run function fetchr:game/start/pre_gen/move_z/10
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 4096.. positioned ~ 0 ~65536 run function fetchr:game/start/pre_gen/move_z/10