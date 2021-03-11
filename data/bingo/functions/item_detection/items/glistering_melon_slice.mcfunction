#> bingo:item_detection/items/glistering_melon_slice
#
# Triggered when the player obtains a minecraft:glistering_melon_slice
#
# @within advancement bingo:item_detection/glistering_melon_slice
# @handles advancement bingo:item_detection/glistering_melon_slice

#>
# @private
#declare score_holder $item_detect/glistering_melon.success

execute store success score $item_detect/glistering_melon.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:glistering_melon_slice"}}] run data modify storage bingo:card slots[{item:{id:"bingo:glistering_melon_slice"}}].selected set value true
execute if score $item_detect/glistering_melon.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce