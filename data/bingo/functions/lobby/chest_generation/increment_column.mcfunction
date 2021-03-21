#> bingo:lobby/chest_generation/increment_column
#
# This increments the column, dealing with possible overflow.
#
# The row is also resetted to 0.
#
# @within bingo:lobby/chest_generation/*

scoreboard players set $chest_generation.row bingo.tmp 0
scoreboard players add $chest_generation.column bingo.tmp 1

execute as @e[type=minecraft:area_effect_cloud, tag=bingo.item_chest_marker] at @s positioned ~ ~1 ~ if score $chest_generation.column bingo.tmp matches 9 run function bingo:lobby/chest_generation/next_chest