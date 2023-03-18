#> fetchr:game/emerald_detection/chunk/move_z/3
#
# Makes sure 1-bit is not set for the z coordinate
#
# @context
# 	entity Player
# 	position @s
# @within function fetchr:game/emerald_detection/chunk/move_z/2

execute if score $emerald_detection.chunkz fetchr.tmp matches 2.. run scoreboard players remove $emerald_detection.chunkz fetchr.tmp 2
execute if score $emerald_detection.chunkz fetchr.tmp matches 0 run function fetchr:game/emerald_detection/chunk/detect_in_y_column
execute if score $emerald_detection.chunkz fetchr.tmp matches 1 positioned ~ ~ ~-1 run function fetchr:game/emerald_detection/chunk/detect_in_y_column