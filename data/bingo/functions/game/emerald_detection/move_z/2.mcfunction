#> bingo:game/emerald_detection/move_z/2
#
# @context
# 	entity Player
# 	position @s
# @within function bingo:game/emerald_detection/move_z/1

execute if score $emerald_detection.chunkz bingo.tmp matches 4.. run scoreboard players remove $emerald_detection.chunkz bingo.tmp 4
execute if score $emerald_detection.chunkz bingo.tmp matches ..1 positioned ~ ~ ~2 run function bingo:game/emerald_detection/move_z/3
execute if score $emerald_detection.chunkz bingo.tmp matches 2.. run function bingo:game/emerald_detection/move_z/3