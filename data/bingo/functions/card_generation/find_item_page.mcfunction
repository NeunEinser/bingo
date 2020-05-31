
scoreboard players operation $item bingo_tmp -= $items bingo_tmp

execute as @e[type=minecraft:area_effect_cloud, tag=bingo_in_category] run scoreboard players remove @s bingo_tmp_2 1
execute store result score $items bingo_tmp if entity @e[type=minecraft:area_effect_cloud, tag=bingo_in_category, scores={bingo_tmp_2=1..}]

execute if score $item bingo_tmp >= $items bingo_tmp run function bingo:card_generation/find_item_page