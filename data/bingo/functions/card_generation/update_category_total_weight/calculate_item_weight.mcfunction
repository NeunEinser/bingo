#> bingo:card_generation/update_category_total_weight/calculate_item_weight
#
# Calculates the weight nominator and denominator for this item and updates its
# category total weights when needed
#
# @within
# 	function bingo:card_generation/update_category_total_weight/update_weight
# 	function bingo:card_generation/update_category_total_weight/calculate_item_weight

#>
# @within function bingo:card_generation/update_category_total_weight/**
#declare score_holder $card_gen/cat_weight.total_weight
execute store result score $card_gen/cat_weight.total_weight bingo.tmp run data get storage tmp.bingo:card_generation itemCategories[-1].totalItemWeight

data modify storage tmp.bingo:card_generation checkCategories set from storage tmp.bingo:card_generation categoriesWithRemovedItem
function bingo:card_generation/update_category_total_weight/calculate_new_total_weight
execute store result storage tmp.bingo:card_generation itemCategories[-1].totalItemWeight int 1 run scoreboard players get $card_gen/cat_weight.total_weight bingo.tmp

#>
# @private
#declare score_holder $card_gen/cat_weight.item_weight
execute store result score $card_gen/cat_weight.item_weight bingo.tmp run data get storage tmp.bingo:card_generation itemCategories[-1].weight

scoreboard players operation $card_gen/cat_weight.item_weight bingo.tmp *= $card_gen/cat_weight.denom bingo.tmp
scoreboard players operation $card_gen/cat_weight.nom bingo.tmp *= $card_gen/cat_weight.total_weight bingo.tmp
scoreboard players operation $card_gen/cat_weight.denom bingo.tmp *= $card_gen/cat_weight.total_weight bingo.tmp
scoreboard players operation $card_gen/cat_weight.nom bingo.tmp += $card_gen/cat_weight.item_weight bingo.tmp

scoreboard players operation $gcd.a 91.math.io = $card_gen/cat_weight.nom bingo.tmp
scoreboard players operation $gcd.b 91.math.io = $card_gen/cat_weight.denom bingo.tmp
function neun_einser.math:greatest_common_divisor
scoreboard players operation $card_gen/cat_weight.nom bingo.tmp /= $gcd.result 91.math.io
scoreboard players operation $card_gen/cat_weight.denom bingo.tmp /= $gcd.result 91.math.io

data modify storage tmp.bingo:card_generation keptItems[-1].activeCategories append from storage tmp.bingo:card_generation itemCategories[-1]
data remove storage tmp.bingo:card_generation itemCategories[-1]

execute if data storage tmp.bingo:card_generation itemCategories[0] run function bingo:card_generation/update_category_total_weight/calculate_item_weight