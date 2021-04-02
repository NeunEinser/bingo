#> bingo:game/emerald_detection/chunk/move_z/0
#
# @context
# 	entity Player
# 	position @s
# @within function bingo:game/emerald_detection/chunk/move_x/3

execute if score $emerald_detection.chunkz bingo.tmp matches ..7 positioned ~ ~ ~8 run function bingo:game/emerald_detection/chunk/move_z/1
execute if score $emerald_detection.chunkz bingo.tmp matches 8.. run function bingo:game/emerald_detection/chunk/move_z/1