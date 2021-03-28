# select category
execute store result score $max nn.math.rand run data get storage bingo:tmp categories

function nope_name.math:rand/exe
scoreboard players operation $cat bingo.tmp = $out nn.math.rand
scoreboard players set $weight_multiplier bingo.tmp 1
scoreboard players set $total_weight bingo.tmp 0
data remove storage bingo:tmp items
function bingo:card_generation/category/find_category


# select item
scoreboard players operation $max nn.math.rand = $total_weight bingo.tmp
function nope_name.math:rand/exe

scoreboard players set $position bingo.tmp 0
function bingo:card_generation/item/find_item

data modify storage bingo:tmp item set from storage bingo:tmp items[0]
data remove storage bingo:tmp items[0]

data modify storage bingo:card_generation forbiddenCategories append from storage bingo:tmp item.categories[]

# copy to slot
data modify storage bingo:tmp slot.item set from storage bingo:tmp item
execute store result storage bingo:tmp slot.id int 1 run scoreboard players get $i bingo.tmp

data modify storage bingo:card slots append from storage bingo:tmp slot

# set item to frame
data modify storage bingo:tmp item.item.Count set value 1b
data modify storage bingo:tmp item.item.tag.display.Name set from storage bingo:tmp item.textComponent
execute as @e[type=minecraft:item_frame, tag=bingo.card_frame] if score @s bingo.frame_id = $i bingo.tmp run data modify entity @s Item set from storage bingo:tmp item.item

# next slot
scoreboard players add $i bingo.tmp 1
execute if score $i bingo.tmp matches ..24 run function bingo:card_generation/generate_slot