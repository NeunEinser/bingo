#> bingo:item_detection/items/dark_oak_sapling
#
# Triggered when the player obtains a minecraft:dark_oak_sapling
#
# @within advancement bingo:item_detection/dark_oak_sapling
# @handles advancement bingo:item_detection/dark_oak_sapling

#>
# @private
#declare score_holder $item_detect/dark_oak_sapling.success

execute store success score $item_detect/dark_oak_sapling.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:dark_oak_sapling"}}] run data modify storage bingo:card slots[{item:{id:"bingo:dark_oak_sapling"}}].selected set value true
execute if score $item_detect/dark_oak_sapling.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce