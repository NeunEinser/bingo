#> bingo:item_detection/items/golden_pickaxe
#
# Triggered when the player obtains a minecraft:golden_pickaxe
#
# @within advancement bingo:item_detection/golden_pickaxe
# @handles advancement bingo:item_detection/golden_pickaxe

#>
# @private
#declare score_holder $item_detect/golden_pickaxe.success

execute store success score $item_detect/golden_pickaxe.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:golden_pickaxe"}}]
execute if score $item_detect/golden_pickaxe.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce