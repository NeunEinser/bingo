#> fetchr:game/emerald_detection/chunk/move_x/1
#
# Makes sure 4-bit is not set for the x coordinate
#
# @context
# 	entity Player
# 	position @s
# @within function fetchr:game/emerald_detection/chunk/move_x/0

execute if score $emerald_detection.chunkx fetchr.tmp matches 8.. run scoreboard players remove $emerald_detection.chunkx fetchr.tmp 8
execute if score $emerald_detection.chunkx fetchr.tmp matches ..3 run function fetchr:game/emerald_detection/chunk/move_x/2
execute if score $emerald_detection.chunkx fetchr.tmp matches 4.. positioned ~-4 ~ ~ run function fetchr:game/emerald_detection/chunk/move_x/2