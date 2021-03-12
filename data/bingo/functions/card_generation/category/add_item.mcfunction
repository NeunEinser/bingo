execute store result score $categories bingo.tmp run data get storage bingo:tmp curCat.items[0].categories

data modify storage bingo:tmp forbiddenCategories set from storage bingo:card_generation forbiddenCategories
scoreboard players set $allowed bingo.tmp 1

execute store result score $size bingo.tmp run data get storage bingo:tmp forbiddenCategories
execute if score $size bingo.tmp matches 1.. run function bingo:card_generation/category/check_item_iter

execute if score $allowed bingo.tmp matches 1 if score $categories bingo.tmp matches 1 run function bingo:card_generation/category/prepare_item
execute if score $allowed bingo.tmp matches 1 if score $categories bingo.tmp matches 2.. run function bingo:card_generation/category/prepare_item_with_multiple_categories
data remove storage bingo:tmp curCat.items[0]

execute store result score $items_left bingo.tmp run data get storage bingo:tmp curCat.items
execute store result score $size bingo.tmp run data get storage bingo:tmp items

execute if score $items_left bingo.tmp matches 0 if score $size bingo.tmp matches 0 run function bingo:card_generation/category/get_next_category
execute if score $items_left bingo.tmp matches 1.. run function bingo:card_generation/category/add_item