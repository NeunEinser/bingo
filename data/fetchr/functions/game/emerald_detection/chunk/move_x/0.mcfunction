#> fetchr:game/emerald_detection/chunk/move_x/0
#
# Makes sure 8-bit is set for the x coordinate
#
# @context
# 	entity Player
# 	position @s
# @within function fetchr:game/emerald_detection/**

execute if score $emerald_detection.chunkx fetchr.tmp matches ..7 positioned ~8 ~ ~ run function fetchr:game/emerald_detection/chunk/move_x/1
execute if score $emerald_detection.chunkx fetchr.tmp matches 8.. run function fetchr:game/emerald_detection/chunk/move_x/1