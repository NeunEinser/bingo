#> bingo:item_detection/items/acacia_sapling
#
# Triggered when the player obtains a minecraft:acacia_sapling
#
# @within advancement bingo:item_detection/acacia_sapling
# @handles advancement bingo:item_detection/acacia_sapling

#>
# @private
#declare score_holder $item_detect/acacia_sapling.success

execute store success score $item_detect/acacia_sapling.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:acacia_sapling"}}]
execute if score $item_detect/acacia_sapling.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce