#> fetchr:game/start/pre_gen/move_z/5
#
# @within function fetchr:game/start/pre_gen/move_z/4

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 131072.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 131072

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..65535 run function fetchr:game/start/pre_gen/move_z/6
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 65536.. positioned ~ 0 ~1048576 run function fetchr:game/start/pre_gen/move_z/6