#> bingo:item_detection/items/spruce_sapling
#
# Triggered when the player obtains a minecraft:spruce_sapling
#
# @within advancement bingo:item_detection/spruce_sapling
# @handles advancement bingo:item_detection/spruce_sapling

#>
# @private
#declare score_holder $item_detect/spruce_sapling.success

execute store success score $item_detect/spruce_sapling.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:spruce_sapling"}}]
execute if score $item_detect/spruce_sapling.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce