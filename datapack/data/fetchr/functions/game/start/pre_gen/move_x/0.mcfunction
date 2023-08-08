#> fetchr:game/start/pre_gen/move_x/0
#
# @within function fetchr:game/start/pre_gen/*

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 0.. positioned 0 0 0 run function fetchr:game/start/pre_gen/move_x/1
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..-1 positioned -33554432 0 0 run function fetchr:game/start/pre_gen/move_x/1