scoreboard players set $max_val random_main 0
scoreboard players operation $max_val random_main += @e[tag=bingo_selectable] bingo_weight
function random:next_int

tag @e[tag=bingo_selected] remove bingo_selected
tag @e[tag=bingo_selectable] remove bingo_skipped
execute as @e[tag=bingo_selectable] run scoreboard players operation @s bingo_tmp = @s bingo_weight
scoreboard players operation $item bingo_tmp = $result random_main

function bingo:card_generation/find_item

scoreboard players operation @e[tag=bingo_selected] bingo_slot_id = $i bingo_tmp

#remove items with the same category from pool 
execute as @e[tag=bingo_selectable] if score @s bingo_category_1 = @e[tag=bingo_selected, limit=1] bingo_category_1 run tag @s remove bingo_selectable
execute as @e[tag=bingo_selectable] if score @s bingo_category_1 = @e[tag=bingo_selected, limit=1] bingo_category_2 run tag @s remove bingo_selectable
execute as @e[tag=bingo_selectable] if score @s bingo_category_2 = @e[tag=bingo_selected, limit=1] bingo_category_1 run tag @s remove bingo_selectable
execute as @e[tag=bingo_selectable] if score @s bingo_category_2 = @e[tag=bingo_selected, limit=1] bingo_category_2 run tag @s remove bingo_selectable
tag @e[tag=bingo_selected] remove bingo_selectable

scoreboard players add $i bingo_tmp 1
execute if score $i bingo_tmp matches ..24 run function bingo:card_generation/generate_slot