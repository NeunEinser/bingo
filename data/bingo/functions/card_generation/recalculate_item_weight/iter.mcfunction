#> bingo:card_generation/recalculate_item_weight/iter
#
# Recalculates the weight of the current item and iterates this function until
# all items are handled.
#
# @within function bingo:card_generation/recalculate_item_weight/*

#>
# @private
#declare score_holder $card_gen/recalc_weight.weight
execute store result score $card_gen/recalc_weight.weight bingo.tmp run data get storage tmp.bingo:card_generation recalculateItems[-1].weightNom
#>
# @private
#declare score_holder $card_gen/recalc_weight.denom
execute store result score $card_gen/recalc_weight.denom bingo.tmp run data get storage tmp.bingo:card_generation recalculateItems[-1].weightDenom

scoreboard players operation $card_gen/recalc_weight.weight bingo.tmp *= $card_gen.available_category_weight bingo.tmp
scoreboard players operation $card_gen/recalc_weight.weight bingo.tmp /= $card_gen/recalc_weight.denom bingo.tmp

execute store result storage tmp.bingo:card_generation recalculateItems[-1].weight int 1 run scoreboard players get $card_gen/recalc_weight.weight bingo.tmp
scoreboard players operation $card_gen.total_weight bingo.tmp += $card_gen/recalc_weight.weight bingo.tmp

data modify storage tmp.bingo:card_generation items append from storage tmp.bingo:card_generation recalculateItems[-1]
data remove storage tmp.bingo:card_generation recalculateItems[-1]

execute if data storage tmp.bingo:card_generation recalculateItems[0] run function bingo:card_generation/recalculate_item_weight/iter