#> bingo:item_detection/items/sweet_berries
#
# Triggered when the player obtains a minecraft:sweet_berries
#
# @within advancement bingo:item_detection/sweet_berries
# @handles advancement bingo:item_detection/sweet_berries

#>
# @private
#declare score_holder $item_detect/sweet_berries.success

execute store success score $item_detect/sweet_berries.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:sweet_berries"}}]
execute if score $item_detect/sweet_berries.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce