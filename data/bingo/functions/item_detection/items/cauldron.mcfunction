#> bingo:item_detection/items/cauldron
#
# Triggered when the player obtains a minecraft:cauldron
#
# @within advancement bingo:item_detection/cauldron
# @handles advancement bingo:item_detection/cauldron

#>
# @private
#declare score_holder $item_detect/cauldron.success

execute store success score $item_detect/cauldron.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:cauldron"}}]
execute if score $item_detect/cauldron.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce