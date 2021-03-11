#> bingo:item_detection/items/melon_slice
#
# Triggered when the player obtains a minecraft:melon_slice
#
# @within advancement bingo:item_detection/melon_slice
# @handles advancement bingo:item_detection/melon_slice

#>
# @private
#declare score_holder $item_detect/melon_slice.success

execute store success score $item_detect/melon_slice.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:melon_slice"}}]
execute if score $item_detect/melon_slice.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce