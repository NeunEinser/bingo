#> fetchr:card_generation/update_category_total_weight/update_weight
#
# Updates the weight of the current item. This function is only called when
# there is at least one category that needs recalculation
#
# @within
# 	function fetchr:card_generation/update_category_total_weight/exec
# 	function fetchr:card_generation/update_category_total_weight/iter

data modify storage tmp.fetchr:card_generation itemCategories set from storage tmp.fetchr:card_generation keptItems[-1].activeCategories
data modify storage tmp.fetchr:card_generation keptItems[-1].activeCategories set value []

#>
# @within function fetchr:card_generation/update_category_total_weight/*
#declare score_holder $card_gen/cat_weight.nom
scoreboard players set $card_gen/cat_weight.nom fetchr.tmp 0
#>
# @within function fetchr:card_generation/update_category_total_weight/*
#declare score_holder $card_gen/cat_weight.denom
scoreboard players set $card_gen/cat_weight.denom fetchr.tmp 1

function fetchr:card_generation/update_category_total_weight/calculate_item_weight

#>
# @private
#declare score_holder $card_gen/cat_weight.category_count
execute store result score $card_gen/cat_weight.category_count fetchr.tmp run data get storage tmp.fetchr:card_generation keptItems[-1].activeCategories
scoreboard players operation $card_gen/cat_weight.denom fetchr.tmp *= $card_gen/cat_weight.category_count fetchr.tmp
scoreboard players operation $gcd.a 91.math.io = $card_gen/cat_weight.nom fetchr.tmp
scoreboard players operation $gcd.b 91.math.io = $card_gen/cat_weight.denom fetchr.tmp
function neun_einser.math:greatest_common_divisor
scoreboard players operation $card_gen/cat_weight.nom fetchr.tmp /= $gcd.result 91.math.io
scoreboard players operation $card_gen/cat_weight.denom fetchr.tmp /= $gcd.result 91.math.io

execute store result storage tmp.fetchr:card_generation keptItems[-1].weightNom int 1 run scoreboard players get $card_gen/cat_weight.nom fetchr.tmp
execute store result storage tmp.fetchr:card_generation keptItems[-1].weightDenom int 1 run scoreboard players get $card_gen/cat_weight.denom fetchr.tmp

#>
# @private
#declare score_holder $card_gen/cat_weight.previous_weight
execute store result score $card_gen/cat_weight.previous_weight fetchr.tmp run data get storage tmp.fetchr:card_generation keptItems[-1].weight
scoreboard players operation $card_gen/cat_weight.nom fetchr.tmp *= $card_gen.available_category_weight fetchr.tmp
scoreboard players operation $card_gen/cat_weight.nom fetchr.tmp /= $card_gen/cat_weight.denom fetchr.tmp
execute store result storage tmp.fetchr:card_generation keptItems[-1].weight int 1 run scoreboard players get $card_gen/cat_weight.nom fetchr.tmp
scoreboard players operation $card_gen.total_weight fetchr.tmp -= $card_gen/cat_weight.previous_weight fetchr.tmp
scoreboard players operation $card_gen.total_weight fetchr.tmp += $card_gen/cat_weight.nom fetchr.tmp

scoreboard players operation $gcd.a 91.math.io = $card_gen/cat_weight.denom fetchr.tmp
scoreboard players operation $gcd.b 91.math.io = $card_gen.required_category_weight fetchr.tmp
function neun_einser.math:greatest_common_divisor
scoreboard players operation $card_gen/cat_weight.denom fetchr.tmp /= $gcd.result 91.math.io
scoreboard players operation $card_gen.required_category_weight fetchr.tmp *= $card_gen/cat_weight.denom fetchr.tmp