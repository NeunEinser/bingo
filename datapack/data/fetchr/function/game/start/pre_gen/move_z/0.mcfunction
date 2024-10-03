#> fetchr:game/start/pre_gen/move_z/0
#
# @within function fetchr:game/start/pre_gen/move_x/21

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 0.. run function fetchr:game/start/pre_gen/move_z/1
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..-1 positioned ~ 0 -33554432 run function fetchr:game/start/pre_gen/move_z/1