#> bingo:item_detection/items/apple
#
# Triggered when the player obtains a minecraft:apple
#
# @within advancement bingo:item_detection/apple
# @handles advancement bingo:item_detection/apple

#>
# @private
#declare score_holder $item_detect/apple.success

execute store success score $item_detect/apple.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:apple"}}]
execute if score $item_detect/apple.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce