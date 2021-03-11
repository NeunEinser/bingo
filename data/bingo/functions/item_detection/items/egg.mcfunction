#> bingo:item_detection/items/egg
#
# Triggered when the player obtains a minecraft:egg
#
# @within advancement bingo:item_detection/egg
# @handles advancement bingo:item_detection/egg

#>
# @private
#declare score_holder $item_detect/egg.success

execute store success score $item_detect/egg.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:egg"}}]
execute if score $item_detect/egg.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce