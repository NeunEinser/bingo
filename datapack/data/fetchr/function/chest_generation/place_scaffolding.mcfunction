#> fetchr:lobby/chest_generation/place_ceiling
#
# Moves to the next chest position and places the chest there
#
# @within function fetchr:lobby/chest_generation/next_chest
# @context
# 	entity Marker area effect cloud that marks the right side of the chest
# 	position @s

execute \
	if block ~-2 ~-1 ~-2 minecraft:scaffolding \
	run setblock ~-2 ~ ~-2 minecraft:scaffolding
execute \
	if block ~3 ~-1 ~-2 minecraft:scaffolding \
	run setblock ~3 ~ ~-2 minecraft:scaffolding