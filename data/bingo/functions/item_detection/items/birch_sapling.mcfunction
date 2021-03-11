#> bingo:item_detection/items/birch_sapling
#
# Triggered when the player obtains a minecraft:birch_sapling
#
# @within advancement bingo:item_detection/birch_sapling
# @handles advancement bingo:item_detection/birch_sapling

#>
# @private
#declare score_holder $item_detect/birch_sapling.success

execute store success score $item_detect/birch_sapling.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:birch_sapling"}}] run data modify storage bingo:card slots[{item:{id:"bingo:birch_sapling"}}].selected set value true
execute if score $item_detect/birch_sapling.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce