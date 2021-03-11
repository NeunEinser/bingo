#> bingo:item_detection/items/bell
#
# Triggered when the player obtains a minecraft:bell
#
# @within advancement bingo:item_detection/bell
# @handles advancement bingo:item_detection/bell

#>
# @private
#declare score_holder $item_detect/bell.success

execute store success score $item_detect/bell.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:bell"}}]
execute if score $item_detect/bell.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce