execute store result score $categories bingo.tmp run data get storage bingo:tmp items[0].categories
execute store result score $weight bingo.tmp run data get storage bingo:tmp items[0].weight

scoreboard players operation $weight bingo.tmp *= $weight_multiplier bingo.tmp
scoreboard players operation $weight bingo.tmp /= $categories bingo.tmp

scoreboard players operation $position bingo.tmp += $weight bingo.tmp

execute if score $position bingo.tmp <= $result random_main run function bingo:card_generation/item/next_item