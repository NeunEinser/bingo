#> fetchr:game/start/pre_gen/generate_chunk
#
# Pregenerates chunks while trying to prevent server lag
#
# @context
# 	entity The marker area effect cloud which marks the row of chunks which was
# 		generated last
# 	position The location of the next chunk to generate
# @within
# 	function fetchr:game/start/pre_gen/goto_current_chunk/21
# 	function fetchr:game/start/pre_gen/generate_chunk

forceload add ~ ~
scoreboard players add $game_start/pre_gen.i fetchr.tmp 1

execute if score $game_start/pre_gen.remaining_in_dir fetchr.tmp matches 0 run function fetchr:game/start/pre_gen/change_dir
execute if score $game_start/pre_gen.direction fetchr.tmp matches 0 run scoreboard players add $game_start/pre_gen.z fetchr.tmp 1
execute if score $game_start/pre_gen.direction fetchr.tmp matches 1 run scoreboard players remove $game_start/pre_gen.x fetchr.tmp 1
execute if score $game_start/pre_gen.direction fetchr.tmp matches 2 run scoreboard players remove $game_start/pre_gen.z fetchr.tmp 1
execute if score $game_start/pre_gen.direction fetchr.tmp matches 3 run scoreboard players add $game_start/pre_gen.x fetchr.tmp 1

scoreboard players remove $game_start/pre_gen.remaining_in_dir fetchr.tmp 1
scoreboard players remove $game_start/pre_gen.chunks_left_in_tick fetchr.tmp 1

execute if score $game_start/pre_gen.chunks_left_in_tick fetchr.tmp matches 0 run schedule function fetchr:game/start/pre_gen/schedule 1t
execute if score $game_start/pre_gen.chunks_left_in_tick fetchr.tmp matches 1.. if score $game_start/pre_gen.direction fetchr.tmp matches 0 positioned ~ ~ ~16 run function fetchr:game/start/pre_gen/generate_chunk
execute if score $game_start/pre_gen.chunks_left_in_tick fetchr.tmp matches 1.. if score $game_start/pre_gen.direction fetchr.tmp matches 1 positioned ~-16 ~ ~ run function fetchr:game/start/pre_gen/generate_chunk
execute if score $game_start/pre_gen.chunks_left_in_tick fetchr.tmp matches 1.. if score $game_start/pre_gen.direction fetchr.tmp matches 2 positioned ~ ~ ~-16 run function fetchr:game/start/pre_gen/generate_chunk
execute if score $game_start/pre_gen.chunks_left_in_tick fetchr.tmp matches 1.. if score $game_start/pre_gen.direction fetchr.tmp matches 3 positioned ~16 ~ ~ run function fetchr:game/start/pre_gen/generate_chunk