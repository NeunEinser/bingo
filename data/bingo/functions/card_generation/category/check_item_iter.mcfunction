data modify storage bingo:tmp forbiddenCategory set from storage bingo:tmp forbiddenCategories[-1]
data modify storage bingo:tmp itemCategories set from storage bingo:tmp curCat.items[0].categories

data remove storage bingo:tmp forbiddenCategories[-1]

scoreboard players operation $tmp_categories bingo.tmp = $categories bingo.tmp
function bingo:card_generation/category/check_item_iter_iter

scoreboard players remove $size bingo.tmp 1

execute if score $size bingo.tmp matches 1.. if score $allowed bingo.tmp matches 1 run function bingo:card_generation/category/check_item_iter