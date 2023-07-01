#> fetchr:game/start/pre_gen/move_z/21
#
# @within function fetchr:game/start/pre_gen/move_z/20

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 2.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 2
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 0 run function fetchr:game/start/pre_gen/go_to_chunk_end
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 1 positioned ~ 0 ~16 run function fetchr:game/start/pre_gen/go_to_chunk_end