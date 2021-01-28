data modify storage bingo:tmp forbiddenItems set from storage bingo:card_generation forbiddenItems
data modify storage bingo:tmp usedItems set from storage bingo:card_generation usedItems

scoreboard players set $forbidden bingo.tmp 1
scoreboard players set $used bingo.tmp 1

execute store result score $forbidden_size bingo.tmp run data get storage bingo:tmp forbiddenItems
scoreboard players operation $size bingo.tmp = $forbidden_size bingo.tmp
execute store result score $used_size bingo.tmp run data get storage bingo:tmp usedItems
scoreboard players operation $size bingo.tmp += $used_size bingo.tmp

execute if score $size bingo.tmp matches 1.. run function bingo:card_generation/category/check_item_iter

execute if score $used bingo.tmp matches 0 run function bingo:card_generation/category/get_next_category
execute if score $forbidden bingo.tmp matches 1 if score $used bingo.tmp matches 1 run function bingo:card_generation/category/prepare_item_with_multiple_categories