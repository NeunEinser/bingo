# select category
#bingo_tmp = category
scoreboard players operation $max_val random_main > @e[type=minecraft:area_effect_cloud, tag=bingo_selectable] bingo_tmp
scoreboard players add $max_val random_main 1

function random:next_int
tag @e[type=minecraft:area_effect_cloud, tag=bingo_in_category] remove bingo_in_category
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_selectable] if score @s bingo_tmp = $result random_main run tag @s add bingo_in_category
execute unless entity @e[type=minecraft:area_effect_cloud, tag=bingo_in_category, limit=1] run function bingo:card_generation/get_different_category

scoreboard players set $max_val random_main 0
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_in_category] run function bingo:card_generation/prepare_item_in_selected_category
function random:next_int

# prepare scores for find item
execute store result score $items bingo_tmp if entity @e[type=minecraft:area_effect_cloud, tag=bingo_in_category]
scoreboard players operation $item bingo_tmp = $result random_main

execute if score $item bingo_tmp >= $items bingo_tmp run function bingo:card_generation/find_item_page
function bingo:card_generation/find_item

execute as @e[type=minecraft:area_effect_cloud, tag=bingo_in_category, tag=bingo_selected] run function bingo:card_generation/set_slot_id

#remove items with the same category from pool 
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_in_category] run function bingo:card_generation/mark_item_as_unselectable
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_selectable] if score @s bingo_tmp > $result random_main run scoreboard players remove @s bingo_tmp 1

scoreboard players add $i bingo_tmp 1
execute if score $i bingo_tmp matches ..24 run function bingo:card_generation/generate_slot