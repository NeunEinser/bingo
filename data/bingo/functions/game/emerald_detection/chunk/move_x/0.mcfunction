#> bingo:game/emerald_detection/chunk/move_x/0
#
# Checks if the biome in the relevant chunk corner (chunk coords 15 15) is a
# biome eligible for emerald generation
#
# @context
# 	entity Player
# 	position @s
# @within function bingo:game/emerald_detection/**

execute if score $emerald_detection.chunkx bingo.tmp matches ..7 positioned ~8 ~ ~ run function bingo:game/emerald_detection/chunk/move_x/1
execute if score $emerald_detection.chunkx bingo.tmp matches 8.. run function bingo:game/emerald_detection/chunk/move_x/1