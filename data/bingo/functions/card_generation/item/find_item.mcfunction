execute store result score $categories bingo_tmp run data get storage bingo:tmp items[0].categories
execute store result score $weight bingo_tmp run data get storage bingo:tmp items[0].weight

scoreboard players operation $weight bingo_tmp *= $weight_multiplier bingo_tmp
scoreboard players operation $weight bingo_tmp /= $categories bingo_tmp

scoreboard players operation $position bingo_tmp += $weight bingo_tmp

tellraw @a ["Position: ", {"score": {"objective": "bingo_tmp", "name": "$position"}}, ", result: ", {"score": {"objective": "random_main", "name": "$result"}}, ", max val: ", {"score": {"objective": "random_main", "name": "$max_val"}}, ", mult: ", {"score": {"objective": "bingo_tmp", "name": "$weight_multiplier"}}]

execute if score $position bingo_tmp <= $result random_main run function bingo:card_generation/item/next_item