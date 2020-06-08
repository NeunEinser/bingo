execute store result score $weight bingo_tmp run data get storage bingo:tmp curCat.items[0].weight
scoreboard players operation $weight bingo_tmp *= $weight_multiplier bingo_tmp
scoreboard players operation $weight bingo_tmp /= $categories bingo_tmp

# add weight to max val
scoreboard players operation $total_weight bingo_tmp += $weight bingo_tmp

data modify storage bingo:tmp items append from storage bingo:tmp curCat.items[0]