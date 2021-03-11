#> bingo:item_detection/items/golden_axe
#
# Triggered when the player obtains a minecraft:golden_axe
#
# @within advancement bingo:item_detection/golden_axe
# @handles advancement bingo:item_detection/golden_axe

#>
# @private
#declare score_holder $item_detect/golden_axe.success

execute store success score $item_detect/golden_axe.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:golden_axe"}}]
execute if score $item_detect/golden_axe.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce