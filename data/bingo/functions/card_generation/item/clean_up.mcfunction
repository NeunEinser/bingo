execute store result score $categories bingo_tmp run data get storage bingo:tmp items[0].categories

execute if score $categories bingo_tmp matches 2.. run data modify storage bingo:card_generation forbiddenItems append from storage bingo:tmp items[0].id
data remove storage bingo:tmp items[0]

execute store result score $size bingo_tmp run data get storage bingo:tmp items
execute if score $size bingo_tmp matches 1.. run function bingo:card_generation/item/clean_up