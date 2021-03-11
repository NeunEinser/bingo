#> bingo:item_detection/items/diamond_hoe
#
# Triggered when the player obtains a minecraft:diamond_hoe
#
# @within advancement bingo:item_detection/diamond_hoe
# @handles advancement bingo:item_detection/diamond_hoe

#>
# @private
#declare score_holder $item_detect/diamond_hoe.success

execute store success score $item_detect/diamond_hoe.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:diamond_hoe"}}] run data modify storage bingo:card slots[{item:{id:"bingo:diamond_hoe"}}].selected set value true
execute if score $item_detect/diamond_hoe.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce