#> fetchr:chest_generation/next_chest
#
# Moves to the next chest position and places the chest there
#
# @within function fetchr:chest_generation/increment_column
# @context
# 	entity Marker area effect cloud that marks the right side of the chest
# 	position @s

execute \
	if score $chest_generation.remaining_cols fetchr.tmp matches 1.. \
	run function fetchr:chest_generation/block_remaining_columns

clone ~ ~ ~ ~1 318 ~ ~ ~1 ~ filtered minecraft:chest move

#>
# @private
#declare score_holder $lobby/chest_gen.use_single_chest
scoreboard players set $lobby/chest_gen.use_single_chest fetchr.tmp 0
execute unless data storage tmp.fetchr:chest_generation categories[-1].items[5] unless data storage tmp.fetchr:chest_generation categories[-5].items[3] run scoreboard players set $lobby/chest_gen.use_single_chest fetchr.tmp 1

execute unless score $lobby/chest_gen.use_single_chest fetchr.tmp matches 1 run setblock ~ ~ ~ minecraft:chest[type=left]{CustomName:{translate:"fetchr.category_chest.name"}}
execute unless score $lobby/chest_gen.use_single_chest fetchr.tmp matches 1 run setblock ~1 ~ ~ minecraft:chest[type=right]{CustomName:{translate:"fetchr.category_chest.name"}}
execute if score $lobby/chest_gen.use_single_chest fetchr.tmp matches 1 run setblock ~ ~ ~ minecraft:chest[type=single]{CustomName:{translate:"fetchr.category_chest.name"}}
execute if score $lobby/chest_gen.use_single_chest fetchr.tmp matches 1 run setblock ~1 ~ ~ minecraft:chest[type=single]{CustomName:{translate:"fetchr.category_chest.name"}}

scoreboard players set $chest_generation.column fetchr.tmp 0
scoreboard players set $chest_generation.row fetchr.tmp 0