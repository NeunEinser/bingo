execute if score $forbidden_size bingo_tmp matches 1.. run data modify storage bingo:tmp item set from storage bingo:tmp forbiddenItems[0]
execute if score $forbidden_size bingo_tmp matches 1.. store success score $forbidden bingo_tmp run data modify storage bingo:tmp item set from storage bingo:tmp curCat.items[0].id
execute if score $used_size bingo_tmp matches 1.. run data modify storage bingo:tmp item set from storage bingo:tmp usedItems[0]
execute if score $used_size bingo_tmp matches 1.. store success score $used bingo_tmp run data modify storage bingo:tmp item set from storage bingo:tmp curCat.items[0].id

data remove storage bingo:tmp forbiddenItems[0]
data remove storage bingo:tmp usedItems[0]

execute store result score $forbidden_size bingo_tmp run data get storage bingo:tmp forbiddenItems
scoreboard players operation $size bingo_tmp = $forbidden_size bingo_tmp
execute store result score $used_size bingo_tmp run data get storage bingo:tmp usedItems
scoreboard players operation $size bingo_tmp += $used_size bingo_tmp

execute if score $size bingo_tmp matches 1.. if score $forbidden bingo_tmp matches 1 if score $used bingo_tmp matches 1 run function bingo:card_generation/category/check_item_iter