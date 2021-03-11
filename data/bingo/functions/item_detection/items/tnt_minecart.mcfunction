#> bingo:item_detection/items/tnt_minecart
#
# Triggered when the player obtains a minecraft:tnt_minecart
#
# @within advancement bingo:item_detection/tnt_minecart
# @handles advancement bingo:item_detection/tnt_minecart

#>
# @private
#declare score_holder $item_detect/tnt_minecart.success

execute store success score $item_detect/tnt_minecart.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:tnt_minecart"}}]
execute if score $item_detect/tnt_minecart.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce