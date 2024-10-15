#> fetchr:card_generation/update_affected_item_weights/update_weights
#
# Updates the weight of the current item.
#
# @within
# 	function fetchr:card_generation/update_affected_item_weights/exec
# 	function fetchr:card_generation/update_affected_item_weights/update_weights

#region calculate weight nom and denom for item
data modify storage tmp.fetchr:card_generation item_categories \
	set from storage tmp.fetchr:card_generation category_items[-1].active_categories

#>
# @within function fetchr:card_generation/update_affected_item_weights/*
#declare score_holder $card_gen/cat_weight.nom
scoreboard players set $card_gen/cat_weight.nom fetchr.tmp 0
#>
# @within function fetchr:card_generation/update_affected_item_weights/*
#declare score_holder $card_gen/cat_weight.denom
scoreboard players set $card_gen/cat_weight.denom fetchr.tmp 1

function fetchr:card_generation/update_affected_item_weights/calculate_item_weight
#endregion

#region Devide by category count and simplify fraction
#>
# @private
#declare score_holder $card_gen/cat_weight.category_count
execute \
	store result score $card_gen/cat_weight.category_count fetchr.tmp \
	run data get storage tmp.fetchr:card_generation category_items[-1].active_categories
scoreboard players operation $card_gen/cat_weight.denom fetchr.tmp *= $card_gen/cat_weight.category_count fetchr.tmp

scoreboard players operation $gcd.a 91.math.io = $card_gen/cat_weight.nom fetchr.tmp
scoreboard players operation $gcd.b 91.math.io = $card_gen/cat_weight.denom fetchr.tmp
function neun_einser.math:greatest_common_divisor
scoreboard players operation $card_gen/cat_weight.nom fetchr.tmp /= $gcd.result 91.math.io
scoreboard players operation $card_gen/cat_weight.denom fetchr.tmp /= $gcd.result 91.math.io

execute \
	store result storage tmp.fetchr:card_generation category_items[-1].weight_nom int 1 \
	run scoreboard players get $card_gen/cat_weight.nom fetchr.tmp
execute \
	store result storage tmp.fetchr:card_generation category_items[-1].weight_denom int 1 \
	run scoreboard players get $card_gen/cat_weight.denom fetchr.tmp
#endregion

#region Calculate new global item weight
#>
# @private
#declare score_holder $card_gen/cat_weight.previous_weight
execute \
	store result score $card_gen/cat_weight.previous_weight fetchr.tmp \
	run data get storage tmp.fetchr:card_generation category_items[-1].weight
scoreboard players operation $card_gen/cat_weight.nom fetchr.tmp *= $card_gen.available_category_weight fetchr.tmp
execute \
	store result storage tmp.fetchr:card_generation category_items[-1].weight int 1 \
	run scoreboard players operation $card_gen/cat_weight.nom fetchr.tmp /= $card_gen/cat_weight.denom fetchr.tmp
#endregion

scoreboard players operation $card_gen.total_weight fetchr.tmp -= $card_gen/cat_weight.previous_weight fetchr.tmp
scoreboard players operation $card_gen.total_weight fetchr.tmp += $card_gen/cat_weight.nom fetchr.tmp

#region calculate requried category weight
scoreboard players operation $gcd.a 91.math.io = $card_gen/cat_weight.denom fetchr.tmp
scoreboard players operation $gcd.b 91.math.io = $card_gen.required_category_weight fetchr.tmp
function neun_einser.math:greatest_common_divisor
scoreboard players operation $card_gen/cat_weight.denom fetchr.tmp /= $gcd.result 91.math.io
scoreboard players operation $card_gen.required_category_weight fetchr.tmp *= $card_gen/cat_weight.denom fetchr.tmp
#endregion

data modify storage tmp.fetchr:card_generation items \
	append from storage tmp.fetchr:card_generation category_items[-1]
data remove storage tmp.fetchr:card_generation category_items[-1]
execute \
	if data storage tmp.fetchr:card_generation category_items[0] \
	run function fetchr:card_generation/update_affected_item_weights/update_weights