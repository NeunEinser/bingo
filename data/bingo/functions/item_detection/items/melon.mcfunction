#> bingo:item_detection/items/melon
#
# Triggered when the player obtains a minecraft:melon
#
# @within advancement bingo:item_detection/melon
# @handles advancement bingo:item_detection/melon

#>
# @private
#declare score_holder $item_detect/melon.success

execute store success score $item_detect/melon.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:melon"}}] run data modify storage bingo:card slots[{item:{id:"bingo:melon"}}].selected set value true
execute if score $item_detect/melon.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce