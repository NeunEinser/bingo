#> bingo:item_detection/items/item_frame
#
# Triggered when the player obtains a minecraft:item_frame
#
# @within advancement bingo:item_detection/item_frame
# @handles advancement bingo:item_detection/item_frame

#>
# @private
#declare score_holder $item_detect/item_frame.success

execute store success score $item_detect/item_frame.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:item_frame"}}]
execute if score $item_detect/item_frame.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce