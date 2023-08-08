#> fetchr:game/start/pre_gen/go_to_chunk_end
#
# @within function fetchr:game/start/pre_gen/move_z/21

#>
# @within function fetchr:game/start/pre_gen/**
#declare score_holder $game_start/pre_gen.end_for_tick
scoreboard players set $game_start/pre_gen.end_for_tick fetchr.tmp 0

execute if score $game_start/pre_gen/goto.type fetchr.tmp matches 1 run function fetchr:game/start/pre_gen/generate/generate_chunk
execute if score $game_start/pre_gen/goto.type fetchr.tmp matches 2 run function fetchr:game/start/pre_gen/entities/process_entities
execute if score $game_start/pre_gen/goto.type fetchr.tmp matches 3 run function fetchr:game/start/pre_gen/unload/unload_chunk