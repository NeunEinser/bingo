#> bingo:item_detection/items/melon_slice
#
# Triggered when the player obtains a minecraft:melon_slice
#
# @within advancement bingo:item_detection/melon_slice
# @handles advancement bingo:item_detection/melon_slice

#>
# @private
#declare score_holder $item_detect/melon_slice.success

execute store success score $item_detect/melon_slice.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:melon_slice"}}] run data modify storage bingo:card slots[{item:{id:"bingo:melon_slice"}}].selected set value true
execute if score $item_detect/melon_slice.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce