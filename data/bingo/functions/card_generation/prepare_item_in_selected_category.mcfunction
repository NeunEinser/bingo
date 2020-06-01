tag @s remove bingo_skipped
scoreboard players operation $id bingo_tmp = @s bingo_id

# Mark item as unselectable
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_selectable] if score @s bingo_id = $id bingo_tmp run tag @s remove bingo_selectable

# determine number of categories this item is in
scoreboard players set $categories bingo_tmp 0
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_item] if score @s bingo_id = $id bingo_tmp run scoreboard players add $categories bingo_tmp 1

# set weight and reduce weight if item is in multiple categories
scoreboard players set @s bingo_tmp_2 12
scoreboard players operation @s bingo_tmp_2 *= @s bingo_weight
scoreboard players operation @s bingo_tmp_2 /= $categories bingo_tmp

# add weight to max val
scoreboard players operation $max_val random_main += @s bingo_tmp_2