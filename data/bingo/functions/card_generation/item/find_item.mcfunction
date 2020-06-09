execute store result score $categories bingo_tmp run data get storage bingo:tmp items[0].categories
execute store result score $weight bingo_tmp run data get storage bingo:tmp items[0].weight

scoreboard players operation $weight bingo_tmp *= $weight_multiplier bingo_tmp
scoreboard players operation $weight bingo_tmp /= $categories bingo_tmp

scoreboard players operation $position bingo_tmp += $weight bingo_tmp

execute if score $position bingo_tmp <= $result random_main run function bingo:card_generation/item/next_item