#> bingo:lobby/chest_generation/next_chest
#
# Moves to the next chest position and places the chest there
#
# @within function bingo:lobby/chest_generation/increment_column
# @context
# 	entity Marker area effect cloud that marks the right side of the chest
# 	position @s

clone ~ ~ ~ ~1 254 ~ ~ ~1 ~ replace move

#>
# @private
#declare score_holder $lobby/chest_gen.next_cat_length
execute store result score $lobby/chest_gen.next_cat_length bingo.tmp run data get storage temp:bingo.chest_generation categories[-1].items

execute unless score $lobby/chest_gen.next_cat_length bingo.tmp matches ..3 run setblock ~ ~ ~ minecraft:chest[type=left]
execute unless score $lobby/chest_gen.next_cat_length bingo.tmp matches ..3 run setblock ~1 ~ ~ minecraft:chest[type=right]
execute if score $lobby/chest_gen.next_cat_length bingo.tmp matches ..3 run setblock ~ ~ ~ minecraft:chest[type=single]
execute if score $lobby/chest_gen.next_cat_length bingo.tmp matches ..3 run setblock ~1 ~ ~ minecraft:chest[type=single]

scoreboard players set $chest_generation.column bingo.tmp 0
scoreboard players set $chest_generation.row bingo.tmp 0