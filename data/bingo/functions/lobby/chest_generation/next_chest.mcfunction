#> bingo:lobby/chest_generation/next_chest
#
# Moves to the next chest and places the chest
#
# @within function bingo:lobby/chest_generation/increment_column
# @context
# 	entity Marker area effect cloud that marks the right side of the chest
# 	position @s

clone ~ ~ ~ ~1 254 ~ ~ ~1 ~ replace move

setblock ~ ~ ~ minecraft:chest[type=left]
setblock ~1 ~ ~ minecraft:chest[type=right]

scoreboard players set $chest_generation.column bingo.tmp 0
scoreboard players set $chest_generation.row bingo.tmp 0