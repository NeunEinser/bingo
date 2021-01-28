execute if score $forbidden_size bingo.tmp matches 1.. run data modify storage bingo:tmp item set from storage bingo:tmp forbiddenItems[0]
execute if score $forbidden_size bingo.tmp matches 1.. store success score $forbidden bingo.tmp run data modify storage bingo:tmp item set from storage bingo:tmp curCat.items[0].id
execute if score $used_size bingo.tmp matches 1.. run data modify storage bingo:tmp item set from storage bingo:tmp usedItems[0]
execute if score $used_size bingo.tmp matches 1.. store success score $used bingo.tmp run data modify storage bingo:tmp item set from storage bingo:tmp curCat.items[0].id

data remove storage bingo:tmp forbiddenItems[0]
data remove storage bingo:tmp usedItems[0]

execute store result score $forbidden_size bingo.tmp run data get storage bingo:tmp forbiddenItems
scoreboard players operation $size bingo.tmp = $forbidden_size bingo.tmp
execute store result score $used_size bingo.tmp run data get storage bingo:tmp usedItems
scoreboard players operation $size bingo.tmp += $used_size bingo.tmp

execute if score $size bingo.tmp matches 1.. if score $forbidden bingo.tmp matches 1 if score $used bingo.tmp matches 1 run function bingo:card_generation/category/check_item_iter