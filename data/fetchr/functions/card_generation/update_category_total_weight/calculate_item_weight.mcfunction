#> fetchr:card_generation/update_category_total_weight/calculate_item_weight
#
# Calculates the weight nominator and denominator for this item and updates its
# category total weights when needed
#
# @within
# 	function fetchr:card_generation/update_category_total_weight/update_weight
# 	function fetchr:card_generation/update_category_total_weight/calculate_item_weight

#>
# @within function fetchr:card_generation/update_category_total_weight/**
#declare score_holder $card_gen/cat_weight.total_weight
execute store result score $card_gen/cat_weight.total_weight fetchr.tmp run data get storage tmp.fetchr:card_generation itemCategories[-1].totalItemWeight

data modify storage tmp.fetchr:card_generation checkCategories set from storage tmp.fetchr:card_generation categoriesWithRemovedItem
function fetchr:card_generation/update_category_total_weight/calculate_new_total_weight
execute store result storage tmp.fetchr:card_generation itemCategories[-1].totalItemWeight int 1 run scoreboard players get $card_gen/cat_weight.total_weight fetchr.tmp

#>
# @private
#declare score_holder $card_gen/cat_weight.item_weight
execute store result score $card_gen/cat_weight.item_weight fetchr.tmp run data get storage tmp.fetchr:card_generation itemCategories[-1].weight

scoreboard players operation $card_gen/cat_weight.item_weight fetchr.tmp *= $card_gen/cat_weight.denom fetchr.tmp
scoreboard players operation $card_gen/cat_weight.nom fetchr.tmp *= $card_gen/cat_weight.total_weight fetchr.tmp
scoreboard players operation $card_gen/cat_weight.denom fetchr.tmp *= $card_gen/cat_weight.total_weight fetchr.tmp
scoreboard players operation $card_gen/cat_weight.nom fetchr.tmp += $card_gen/cat_weight.item_weight fetchr.tmp

scoreboard players operation $gcd.a 91.math.io = $card_gen/cat_weight.nom fetchr.tmp
scoreboard players operation $gcd.b 91.math.io = $card_gen/cat_weight.denom fetchr.tmp
function neun_einser.math:greatest_common_divisor
scoreboard players operation $card_gen/cat_weight.nom fetchr.tmp /= $gcd.result 91.math.io
scoreboard players operation $card_gen/cat_weight.denom fetchr.tmp /= $gcd.result 91.math.io

data modify storage tmp.fetchr:card_generation keptItems[-1].activeCategories append from storage tmp.fetchr:card_generation itemCategories[-1]
data remove storage tmp.fetchr:card_generation itemCategories[-1]

execute if data storage tmp.fetchr:card_generation itemCategories[0] run function fetchr:card_generation/update_category_total_weight/calculate_item_weight