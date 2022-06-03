#> bingo:card_generation/find_item
#
# Finds the randomly picked item
#
# @within
# 	function bingo:card_generation/generate_slot
# 	function bingo:card_generation/find_item

#>
# Used to get the weight of the current item
# @private
#declare score_holder $card_gen/find_item.current_weight
execute store result score $card_gen/find_item.current_weight bingo.tmp run data get storage tmp.bingo:card_generation items[-1].weight

data modify storage tmp.bingo:card_generation skippedItems append from storage tmp.bingo:card_generation items[-1]
data remove storage tmp.bingo:card_generation items[-1]

scoreboard players operation $rand.out 91.math.io -= $card_gen/find_item.current_weight bingo.tmp

execute if score $rand.out 91.math.io matches 0.. run function bingo:card_generation/find_item