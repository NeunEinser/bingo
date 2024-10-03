#> fetchr:game/start/pre_gen/generate/generate_chunk
#
# Pregenerates chunks while trying to prevent server lag
#
# @context
# 	entity The marker area effect cloud which marks the row of chunks which was
# 		generated last
# 	position The location of the next chunk to generate
# @within
# 	function fetchr:game/start/pre_gen/go_to_chunk_end
# 	function fetchr:game/start/pre_gen/generate/generate_chunk

execute if score $game_start/pre_gen.chunks_left_in_tick fetchr.tmp matches ..0 unless loaded ~ ~ ~ run scoreboard players set $game_start/pre_gen.end_for_tick fetchr.tmp 1
execute if score $game_start/pre_gen.end_for_tick fetchr.tmp matches 1 run return 0

forceload add ~ ~
scoreboard players add $game_start/pre_gen/generate.i fetchr.tmp 1

execute if score $game_start/pre_gen/generate.remaining_in_dir fetchr.tmp matches 0 run function fetchr:game/start/pre_gen/generate/change_dir
execute if score $game_start/pre_gen/generate.direction fetchr.tmp matches 0 run scoreboard players add $game_start/pre_gen/generate.z fetchr.tmp 1
execute if score $game_start/pre_gen/generate.direction fetchr.tmp matches 1 run scoreboard players remove $game_start/pre_gen/generate.x fetchr.tmp 1
execute if score $game_start/pre_gen/generate.direction fetchr.tmp matches 2 run scoreboard players remove $game_start/pre_gen/generate.z fetchr.tmp 1
execute if score $game_start/pre_gen/generate.direction fetchr.tmp matches 3 run scoreboard players add $game_start/pre_gen/generate.x fetchr.tmp 1

scoreboard players remove $game_start/pre_gen/generate.remaining_in_dir fetchr.tmp 1
scoreboard players remove $game_start/pre_gen.chunks_left_in_tick fetchr.tmp 1

execute if score $game_start/pre_gen/generate.direction fetchr.tmp matches 0 positioned ~ ~ ~16 run function fetchr:game/start/pre_gen/generate/generate_chunk
execute if score $game_start/pre_gen/generate.direction fetchr.tmp matches 1 positioned ~-16 ~ ~ run function fetchr:game/start/pre_gen/generate/generate_chunk
execute if score $game_start/pre_gen/generate.direction fetchr.tmp matches 2 positioned ~ ~ ~-16 run function fetchr:game/start/pre_gen/generate/generate_chunk
execute if score $game_start/pre_gen/generate.direction fetchr.tmp matches 3 positioned ~16 ~ ~ run function fetchr:game/start/pre_gen/generate/generate_chunk