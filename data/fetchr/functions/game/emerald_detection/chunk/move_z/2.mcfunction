#> fetchr:game/emerald_detection/chunk/move_z/2
#
# Makes sure 2-bit is set for the z coordinate
#
# @context
# 	entity Player
# 	position @s
# @within function fetchr:game/emerald_detection/chunk/move_z/1

execute if score $emerald_detection.chunkz fetchr.tmp matches 4.. run scoreboard players remove $emerald_detection.chunkz fetchr.tmp 4
execute if score $emerald_detection.chunkz fetchr.tmp matches ..1 positioned ~ ~ ~2 run function fetchr:game/emerald_detection/chunk/move_z/3
execute if score $emerald_detection.chunkz fetchr.tmp matches 2.. run function fetchr:game/emerald_detection/chunk/move_z/3