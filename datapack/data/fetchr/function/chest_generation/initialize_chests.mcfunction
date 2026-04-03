#> fetchr:chest_generation/initialize_chests
#
# This function removes all chests and sets the initial two.
#
# @within function fetchr:chest_generation/generate_item_chests

fill ~ ~ ~ ~1 319 ~ minecraft:air replace minecraft:chest
setblock ~ ~ ~ air destroy
setblock ~1 ~ ~ air destroy

function fetchr:chest_generation/category_iter

scoreboard players set $chest_generation.remaining_cols fetchr.tmp 8
execute \
	if block ~ ~ ~ minecraft:chest[type=single] \
	run scoreboard players set $chest_generation.remaining_cols fetchr.tmp 17
scoreboard players operation $chest_generation.remaining_cols fetchr.tmp -= $chest_generation.column fetchr.tmp
execute \
	if score $chest_generation.remaining_cols fetchr.tmp matches 1.. \
	run function fetchr:chest_generation/block_remaining_columns