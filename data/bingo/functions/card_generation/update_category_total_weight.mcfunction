#> bingo:card_generation/update_category_total_weight
#
# In case items where removed in the remove_items function that have multiple
# categories, the total weight of these secondary categories has to be
# recalcualted.
#
# This function recalculates said total weight and also attempts to recalculate
# the global weight of items.
#
# The recalculation of global item weights will fail in case the current
# available category weight does not make an even split possible for some items.
#
# @within
# 	function bingo:card_generation/generate_slot
# 	function bingo:card_generation/update_category_total_weight

data modify storage tmp.bingo:card_generation itemCategories set from storage tmp.bingo:card_generation keptItems[-1].activeCategories
data modify storage tmp.bingo:card_generation keptItems[-1].activeCategories set value []

#>
# @within
# 	function bingo:card_generation/update_category_total_weight
# 	function bingo:card_generation/update_category_total_weight/**
#declare score_holder $card_gen/cat_weight.nom
scoreboard players set $card_gen/cat_weight.nom bingo.tmp 0
#>
# @within
# 	function bingo:card_generation/update_category_total_weight
# 	function bingo:card_generation/update_category_total_weight/**
#declare score_holder $card_gen/cat_weight.denom
scoreboard players set $card_gen/cat_weight.denom bingo.tmp 1

function bingo:card_generation/update_category_total_weight/calculate_item_weight

#>
# @private
#declare score_holder $card_gen/cat_weight.category_count
execute store result score $card_gen/cat_weight.category_count bingo.tmp run data get storage tmp.bingo:card_generation keptItems[-1].activeCategories
scoreboard players operation $card_gen/cat_weight.denom bingo.tmp *= $card_gen/cat_weight.category_count bingo.tmp
scoreboard players operation $gcd.a 91.math.io = $card_gen/cat_weight.nom bingo.tmp
scoreboard players operation $gcd.b 91.math.io = $card_gen/cat_weight.denom bingo.tmp
function neuneinser.math:greatest_common_divisor
scoreboard players operation $card_gen/cat_weight.nom bingo.tmp /= $gcd.result 91.math.io
scoreboard players operation $card_gen/cat_weight.denom bingo.tmp /= $gcd.result 91.math.io

execute store result storage tmp.bingo:card_generation keptItems[-1].weightNom int 1 run scoreboard players get $card_gen/cat_weight.nom bingo.tmp
execute store result storage tmp.bingo:card_generation keptItems[-1].weightDenom int 1 run scoreboard players get $card_gen/cat_weight.denom bingo.tmp

#>
# @private
#declare score_holder $card_gen/cat_weight.previous_weight
execute store result score $card_gen/cat_weight.previous_weight bingo.tmp run data get storage tmp.bingo:card_generation keptItems[-1].weight
scoreboard players operation $card_gen/cat_weight.nom bingo.tmp *= $card_gen.available_category_weight bingo.tmp
scoreboard players operation $card_gen/cat_weight.nom bingo.tmp /= $card_gen/cat_weight.denom bingo.tmp
execute store result storage tmp.bingo:card_generation keptItems[-1].weight int 1 run scoreboard players get $card_gen/cat_weight.nom bingo.tmp
scoreboard players operation $card_gen.total_weight bingo.tmp -= $card_gen/cat_weight.previous_weight bingo.tmp
scoreboard players operation $card_gen.total_weight bingo.tmp += $card_gen/cat_weight.nom bingo.tmp

scoreboard players operation $gcd.a 91.math.io = $card_gen/cat_weight.denom bingo.tmp
scoreboard players operation $gcd.b 91.math.io = $card_gen.required_category_weight bingo.tmp
function neuneinser.math:greatest_common_divisor
scoreboard players operation $card_gen/cat_weight.denom bingo.tmp /= $gcd.result 91.math.io
scoreboard players operation $card_gen.required_category_weight bingo.tmp *= $card_gen/cat_weight.denom bingo.tmp

data modify storage tmp.bingo:card_generation items append from storage tmp.bingo:card_generation keptItems[-1]
data remove storage tmp.bingo:card_generation keptItems[-1]

execute if data storage tmp.bingo:card_generation keptItems[0] run function bingo:card_generation/update_category_total_weight