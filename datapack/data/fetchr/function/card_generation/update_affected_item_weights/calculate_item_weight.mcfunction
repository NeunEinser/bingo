#> fetchr:card_generation/update_affected_item_weights/calculate_item_weight
#
# Calculates the weight nominator and denominator for this item and updates its
# category total weights when needed
#
# @within
# 	function fetchr:card_generation/update_affected_item_weights/update_weight
# 	function fetchr:card_generation/update_affected_item_weights/calculate_item_weight

#>
# @within function fetchr:card_generation/update_affected_item_weights/**
#declare score_holder $card_gen/cat_weight.total_weight
execute \
	store result score $card_gen/cat_weight.total_weight fetchr.tmp \
	run data get storage tmp.fetchr:card_generation item_categories[-1].total_item_weight

#>
# @private
#declare score_holder $card_gen/cat_weight.item_weight
execute \
	store result score $card_gen/cat_weight.item_weight fetchr.tmp \
	run data get storage tmp.fetchr:card_generation item_categories[-1].weight

scoreboard players operation $card_gen/cat_weight.item_weight fetchr.tmp *= $card_gen/cat_weight.denom fetchr.tmp
scoreboard players operation $card_gen/cat_weight.nom fetchr.tmp *= $card_gen/cat_weight.total_weight fetchr.tmp
scoreboard players operation $card_gen/cat_weight.denom fetchr.tmp *= $card_gen/cat_weight.total_weight fetchr.tmp
scoreboard players operation $card_gen/cat_weight.nom fetchr.tmp += $card_gen/cat_weight.item_weight fetchr.tmp

data remove storage tmp.fetchr:card_generation item_categories[-1]

execute \
	if data storage tmp.fetchr:card_generation item_categories[0] \
	run function fetchr:card_generation/update_affected_item_weights/calculate_item_weight