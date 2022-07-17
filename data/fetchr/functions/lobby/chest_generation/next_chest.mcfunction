#> fetchr:lobby/chest_generation/next_chest
#
# Moves to the next chest position and places the chest there
#
# @within function fetchr:lobby/chest_generation/increment_column
# @context
# 	entity Marker area effect cloud that marks the right side of the chest
# 	position @s

clone ~ ~ ~ ~1 62 ~ ~ ~1 ~ filtered minecraft:chest move

#>
# @private
#declare score_holder $lobby/chest_gen.next_cat_length
execute store result score $lobby/chest_gen.next_cat_length fetchr.tmp run data get storage tmp.fetchr:chest_generation categories[-1].items

execute unless score $lobby/chest_gen.next_cat_length fetchr.tmp matches ..3 run setblock ~ ~ ~ minecraft:chest[type=left]
execute unless score $lobby/chest_gen.next_cat_length fetchr.tmp matches ..3 run setblock ~1 ~ ~ minecraft:chest[type=right]
execute if score $lobby/chest_gen.next_cat_length fetchr.tmp matches ..3 run setblock ~ ~ ~ minecraft:chest[type=single]
execute if score $lobby/chest_gen.next_cat_length fetchr.tmp matches ..3 run setblock ~1 ~ ~ minecraft:chest[type=single]

scoreboard players set $chest_generation.column fetchr.tmp 0
scoreboard players set $chest_generation.row fetchr.tmp 0