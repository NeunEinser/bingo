data modify storage bingo:tmp curCat set from storage bingo:tmp categories[0]
data remove storage bingo:tmp categories[0]

execute if score $cat bingo_tmp matches 0 run function bingo:card_generation/category/add_item
execute if score $cat bingo_tmp matches 1.. run data modify storage bingo:tmp categories append from storage bingo:tmp curCat

scoreboard players remove $cat bingo_tmp 1

execute if score $cat bingo_tmp matches 0.. run function bingo:card_generation/category/find_category