#> bingo:item_detection/items/lime_dye
#
# Triggered when the player obtains a minecraft:lime_dye
#
# @within advancement bingo:item_detection/lime_dye
# @handles advancement bingo:item_detection/lime_dye

#>
# @private
#declare score_holder $item_detect/lime_dye.success

execute store success score $item_detect/lime_dye.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:lime_dye"}}]
execute if score $item_detect/lime_dye.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce