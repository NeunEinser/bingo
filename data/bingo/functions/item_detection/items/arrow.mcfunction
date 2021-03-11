#> bingo:item_detection/items/arrow
#
# Triggered when the player obtains a minecraft:arrow
#
# @within advancement bingo:item_detection/arrow
# @handles advancement bingo:item_detection/arrow

#>
# @private
#declare score_holder $item_detect/arrow.success

execute store success score $item_detect/arrow.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:arrow"}}]
execute if score $item_detect/arrow.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce