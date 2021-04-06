#> bingo:game/start/pre_generate_next_chunk
#
# Pregenerates one chunk
#
# @context
# 	entity The marker area effect cloud which marks the row of chunks which was
# 		generated last
# 	position @s
# @within function bingo:game/start/pre_generate_spawn

forceload add ~16 ~-320 ~16 ~320
teleport @s ~16 ~ ~

execute unless score $game_start/pre_gen.i bingo.tmp matches ..40 positioned ~-304 ~ ~ run function bingo:game/start/spawn_skybox