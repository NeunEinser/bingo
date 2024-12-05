#> fetchr:lobby/chest_generation/place_ceiling
#
# Moves to the next chest position and places the chest there
#
# @within function fetchr:lobby/chest_generation/next_chest
# @context
# 	entity Marker area effect cloud that marks the right side of the chest
# 	position @s

setblock ~ ~ ~ minecraft:structure_block[mode=load]{name: "fetchr:chest_ceiling", mode: "LOAD", posX: 1}
setblock ~ ~1 ~ minecraft:redstone_block
fill ~ ~ ~ ~ ~1 ~ minecraft:air