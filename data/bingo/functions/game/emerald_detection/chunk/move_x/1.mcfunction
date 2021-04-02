#> bingo:game/emerald_detection/chunk/move_x/1
#
# @context
# 	entity Player
# 	position @s
# @within function bingo:game/emerald_detection/chunk/move_x/0

execute if score $emerald_detection.chunkx bingo.tmp matches 8.. run scoreboard players remove $emerald_detection.chunkx bingo.tmp 8
execute if score $emerald_detection.chunkx bingo.tmp matches ..3 run function bingo:game/emerald_detection/chunk/move_x/2
execute if score $emerald_detection.chunkx bingo.tmp matches 4.. positioned ~-4 ~ ~ run function bingo:game/emerald_detection/chunk/move_x/2