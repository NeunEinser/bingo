execute store result score $categories bingo.tmp run data get storage bingo:tmp items[0].categories

execute if score $categories bingo.tmp matches 2.. run data modify storage bingo:card_generation forbiddenItems append from storage bingo:tmp items[0].id
data remove storage bingo:tmp items[0]

execute store result score $size bingo.tmp run data get storage bingo:tmp items
execute if score $size bingo.tmp matches 1.. run function bingo:card_generation/item/clean_up