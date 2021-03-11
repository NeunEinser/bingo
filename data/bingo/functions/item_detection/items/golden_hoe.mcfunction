#> bingo:item_detection/items/golden_hoe
#
# Triggered when the player obtains a minecraft:golden_hoe
#
# @within advancement bingo:item_detection/golden_hoe
# @handles advancement bingo:item_detection/golden_hoe

#>
# @private
#declare score_holder $item_detect/golden_hoe.success

execute store success score $item_detect/golden_hoe.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:golden_hoe"}}]
execute if score $item_detect/golden_hoe.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce