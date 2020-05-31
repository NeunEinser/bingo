tag @e[type=minecraft:area_effect_cloud, tag=bingo_in_category] remove bingo_in_category

execute as @e[type=minecraft:area_effect_cloud, tag=bingo_selectable] if score @s bingo_tmp > $result random_main run scoreboard players remove @s bingo_tmp 1
scoreboard players remove $max_val random_main 1
function random:apply_max_val

execute as @e[type=minecraft:area_effect_cloud, tag=bingo_selectable] if score @s bingo_tmp = $result random_main run tag @s add bingo_in_category
execute unless entity @e[type=minecraft:area_effect_cloud, tag=bingo_in_category, limit=1] run function bingo:card_generation/get_different_category