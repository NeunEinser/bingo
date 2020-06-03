scoreboard players operation @s[tag=!bingo_additional_category] bingo_slot_id = $i bingo_tmp

scoreboard players operation $category bingo_tmp = @s bingo_category
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_selectable] if score @s bingo_category = $category bingo_tmp run function bingo:card_generation/mark_as_unselectable