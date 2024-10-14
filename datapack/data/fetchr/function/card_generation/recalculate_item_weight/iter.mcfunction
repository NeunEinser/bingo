#> fetchr:card_generation/recalculate_item_weight/iter
#
# Recalculates the weight of the current item and iterates this function until
# all items are handled.
#
# @within function fetchr:card_generation/recalculate_item_weight/*

$execute \
	unless data storage tmp.fetchr:card_generation items[$(i)] \
	run return 0

#>
# @private
#declare score_holder $card_gen/recalc_weight.weight
$execute \
	store result score $card_gen/recalc_weight.weight fetchr.tmp \
	run data get storage tmp.fetchr:card_generation items[$(i)].weight_nom
#>
# @private
#declare score_holder $card_gen/recalc_weight.denom
$execute \
	store result score $card_gen/recalc_weight.denom fetchr.tmp \
	run data get storage tmp.fetchr:card_generation items[$(i)].weight_denom

scoreboard players operation $card_gen/recalc_weight.weight fetchr.tmp *= $card_gen.available_category_weight fetchr.tmp
scoreboard players operation $card_gen/recalc_weight.weight fetchr.tmp /= $card_gen/recalc_weight.denom fetchr.tmp

$execute \
	store result storage tmp.fetchr:card_generation items[$(i)].weight int 1 \
	run scoreboard players get $card_gen/recalc_weight.weight fetchr.tmp
scoreboard players operation $card_gen.total_weight fetchr.tmp += $card_gen/recalc_weight.weight fetchr.tmp

execute \
	store result storage tmp.fetchr:card_generation recalculate_items_iter.i int 1 \
	run scoreboard players add $card_gen/item_weight.i fetchr.tmp 1
function fetchr:card_generation/recalculate_item_weight/iter \
	with storage tmp.fetchr:card_generation recalculate_items_iter