#> bingo:game/emerald_detection/move_x/3
#
# @context
# 	entity Player
# 	position @s
# @within function bingo:game/emerald_detection/move_x/2

execute if score $emerald_detection.chunkx bingo.tmp matches 2.. run scoreboard players remove $emerald_detection.chunkx bingo.tmp 2
execute if score $emerald_detection.chunkx bingo.tmp matches ..0 positioned ~1 ~ ~ run function bingo:game/emerald_detection/move_z/0
execute if score $emerald_detection.chunkx bingo.tmp matches 1.. run function bingo:game/emerald_detection/move_z/0