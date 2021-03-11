#> bingo:item_detection/items/mushroom_stew
#
# Triggered when the player obtains a minecraft:mushroom_stew
#
# @within advancement bingo:item_detection/mushroom_stew
# @handles advancement bingo:item_detection/mushroom_stew

#>
# @private
#declare score_holder $item_detect/mushroom_stew.success

execute store success score $item_detect/mushroom_stew.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:mushroom_stew"}}]
execute if score $item_detect/mushroom_stew.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce