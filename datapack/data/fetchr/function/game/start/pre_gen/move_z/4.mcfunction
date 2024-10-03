#> fetchr:game/start/pre_gen/move_z/4
#
# @within function fetchr:game/start/pre_gen/move_z/3

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 262144.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 262144

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..131071 run function fetchr:game/start/pre_gen/move_z/5
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 131072.. positioned ~ 0 ~2097152 run function fetchr:game/start/pre_gen/move_z/5