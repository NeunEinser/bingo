execute store result score $weight bingo.tmp run data get storage bingo:tmp curCat.items[0].weight
scoreboard players operation $weight bingo.tmp *= $weight_multiplier bingo.tmp
scoreboard players operation $weight bingo.tmp /= $categories bingo.tmp

# add weight to max val
scoreboard players operation $total_weight bingo.tmp += $weight bingo.tmp

data modify storage bingo:tmp items append from storage bingo:tmp curCat.items[0]