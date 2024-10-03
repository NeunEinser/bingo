#> fetchr:game/start/pre_gen/move_z/11
#
# @within function fetchr:game/start/pre_gen/move_z/10

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 2048.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 2048

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..1023 run function fetchr:game/start/pre_gen/move_z/12
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 1024.. positioned ~ 0 ~16384 run function fetchr:game/start/pre_gen/move_z/12