#> bingo:item_detection/items/diamond_sword
#
# Triggered when the player obtains a minecraft:diamond_sword
#
# @within advancement bingo:item_detection/diamond_sword
# @handles advancement bingo:item_detection/diamond_sword

#>
# @private
#declare score_holder $item_detect/diamond_sword.success

execute store success score $item_detect/diamond_sword.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:diamond_sword"}}]
execute if score $item_detect/diamond_sword.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce