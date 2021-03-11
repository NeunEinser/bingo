#> bingo:item_detection/items/cod
#
# Triggered when the player obtains a minecraft:cod
#
# @within advancement bingo:item_detection/cod
# @handles advancement bingo:item_detection/cod

#>
# @private
#declare score_holder $item_detect/cod.success

execute store success score $item_detect/cod.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:cod"}}]
execute if score $item_detect/cod.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce