#> bingo:item_detection/items/flint
#
# Triggered when the player obtains a minecraft:flint
#
# @within advancement bingo:item_detection/flint
# @handles advancement bingo:item_detection/flint

#>
# @private
#declare score_holder $item_detect/flint.success

execute store success score $item_detect/flint.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:flint"}}]
execute if score $item_detect/flint.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce