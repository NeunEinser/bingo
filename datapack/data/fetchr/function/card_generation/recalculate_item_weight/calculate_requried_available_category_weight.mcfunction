#> fetchr:card_generation/recalculate_item_weight/calculate_available_category_weight
#
# Recalculates the needed available category weight
#
# @params i: int
# @within
# 	function fetchr:card_generation/recalculate_item_weight/exec
# 	function fetchr:card_generation/recalculate_item_weight/calculate_available_category_weight


$execute \
	unless data storage tmp.fetchr:card_generation items[$(i)] \
	run return 0

$execute \
	store result score $card_gen/item_weight.denom fetchr.tmp \
	run data get storage tmp.fetchr:card_generation items[$(i)].weight_denom
scoreboard players operation $gcd.a 91.math.io = $card_gen/item_weight.denom fetchr.tmp
scoreboard players operation $gcd.b 91.math.io = $card_gen.available_category_weight fetchr.tmp
function neun_einser.math:greatest_common_divisor
scoreboard players operation $card_gen/item_weight.denom fetchr.tmp /= $gcd.result 91.math.io
scoreboard players operation $card_gen.available_category_weight fetchr.tmp *= $card_gen/item_weight.denom fetchr.tmp

execute \
	store result storage tmp.fetchr:card_generation recalculate_items_iter.i int 1 \
	run scoreboard players add $card_gen/item_weight.i fetchr.tmp 1
function fetchr:card_generation/recalculate_item_weight/calculate_requried_available_category_weight \
	with storage tmp.fetchr:card_generation recalculate_items_iter