#> bingo:item_detection/items/chest_minecart
#
# Triggered when the player obtains a minecraft:chest_minecart
#
# @within advancement bingo:item_detection/chest_minecart
# @handles advancement bingo:item_detection/chest_minecart

#>
# @private
#declare score_holder $item_detect/chest_minecart.success

execute store success score $item_detect/chest_minecart.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:chest_minecart"}}]
execute if score $item_detect/chest_minecart.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce