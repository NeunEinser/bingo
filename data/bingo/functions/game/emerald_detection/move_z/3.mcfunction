#> bingo:game/emerald_detection/move_z/3
#
# @context
# 	entity Player
# 	position @s
# @within function bingo:game/emerald_detection/move_z/2

execute if score $emerald_detection.chunkz bingo.tmp matches 2.. run scoreboard players remove $emerald_detection.chunkz bingo.tmp 2
execute if score $emerald_detection.chunkz bingo.tmp matches ..0 positioned ~ ~ ~1 run function bingo:game/emerald_detection/detect_emerald_biome
execute if score $emerald_detection.chunkz bingo.tmp matches 1.. run function bingo:game/emerald_detection/detect_emerald_biome