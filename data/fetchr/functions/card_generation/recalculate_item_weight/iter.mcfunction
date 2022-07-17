#> fetchr:card_generation/recalculate_item_weight/iter
#
# Recalculates the weight of the current item and iterates this function until
# all items are handled.
#
# @within function fetchr:card_generation/recalculate_item_weight/*

#>
# @private
#declare score_holder $card_gen/recalc_weight.weight
execute store result score $card_gen/recalc_weight.weight fetchr.tmp run data get storage tmp.fetchr:card_generation recalculateItems[-1].weightNom
#>
# @private
#declare score_holder $card_gen/recalc_weight.denom
execute store result score $card_gen/recalc_weight.denom fetchr.tmp run data get storage tmp.fetchr:card_generation recalculateItems[-1].weightDenom

scoreboard players operation $card_gen/recalc_weight.weight fetchr.tmp *= $card_gen.available_category_weight fetchr.tmp
scoreboard players operation $card_gen/recalc_weight.weight fetchr.tmp /= $card_gen/recalc_weight.denom fetchr.tmp

execute store result storage tmp.fetchr:card_generation recalculateItems[-1].weight int 1 run scoreboard players get $card_gen/recalc_weight.weight fetchr.tmp
scoreboard players operation $card_gen.total_weight fetchr.tmp += $card_gen/recalc_weight.weight fetchr.tmp

data modify storage tmp.fetchr:card_generation items append from storage tmp.fetchr:card_generation recalculateItems[-1]
data remove storage tmp.fetchr:card_generation recalculateItems[-1]

execute if data storage tmp.fetchr:card_generation recalculateItems[0] run function fetchr:card_generation/recalculate_item_weight/iter