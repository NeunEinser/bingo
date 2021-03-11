#> bingo:item_detection/items/jungle_sapling
#
# Triggered when the player obtains a minecraft:jungle_sapling
#
# @within advancement bingo:item_detection/jungle_sapling
# @handles advancement bingo:item_detection/jungle_sapling

#>
# @private
#declare score_holder $item_detect/jungle_sapling.success

execute store success score $item_detect/jungle_sapling.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:jungle_sapling"}}] run data modify storage bingo:card slots[{item:{id:"bingo:jungle_sapling"}}].selected set value true
execute if score $item_detect/jungle_sapling.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce