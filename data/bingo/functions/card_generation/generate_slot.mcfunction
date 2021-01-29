# select category
execute store result score $max_val random_main run data get storage bingo:tmp categories

function random:next_int
scoreboard players operation $cat bingo.tmp = $result random_main
scoreboard players set $weight_multiplier bingo.tmp 1
scoreboard players set $total_weight bingo.tmp 0
data remove storage bingo:tmp items
function bingo:card_generation/category/find_category

# select item
scoreboard players operation $max_val random_main = $total_weight bingo.tmp
function random:next_int

scoreboard players set $position bingo.tmp 0
function bingo:card_generation/item/find_item

data modify storage bingo:tmp item set from storage bingo:tmp items[0]
data remove storage bingo:tmp items[0]

execute store result score $size bingo.tmp run data get storage bingo:tmp items
execute if score $size bingo.tmp matches 1.. run function bingo:card_generation/item/clean_up

# copy to slot
execute store result score $categories bingo.tmp run data get storage bingo:tmp item.categories
execute if score $categories bingo.tmp matches 2.. run data modify storage bingo:card_generation usedItems append from storage bingo:tmp item.id

data modify storage bingo:tmp slot.item set from storage bingo:tmp item
execute store result storage bingo:tmp slot.id int 1 run scoreboard players get $i bingo.tmp

data modify storage bingo:card slots append from storage bingo:tmp slot

# set item to frame
data modify storage bingo:tmp item.item.Count set value 1b
data modify storage bingo:tmp item.item.tag.bingo.frameItem set value true
execute as @e[type=minecraft:item_frame, tag=bingo.card_frame] if score @s bingo.frame_id = $i bingo.tmp run data modify entity @s Item set from storage bingo:tmp item.item

# next slot
scoreboard players add $i bingo.tmp 1
execute if score $i bingo.tmp matches ..24 run function bingo:card_generation/generate_slot