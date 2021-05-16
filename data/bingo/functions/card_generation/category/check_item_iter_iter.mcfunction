execute if data storage bingo:tmp itemCategories[-1].id run data modify storage bingo:tmp category set from storage bingo:tmp itemCategories[-1].id
execute unless data storage bingo:tmp itemCategories[-1].id run data modify storage bingo:tmp category set from storage bingo:tmp itemCategories[-1]
execute store success score $allowed bingo.tmp run data modify storage bingo:tmp category set from storage bingo:tmp forbiddenCategory

data remove storage bingo:tmp itemCategories[-1]
scoreboard players remove $tmp_categories bingo.tmp 1

execute if score $tmp_categories bingo.tmp matches 1.. if score $allowed bingo.tmp matches 1 run function bingo:card_generation/category/check_item_iter_iter