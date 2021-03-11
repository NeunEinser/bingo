#> bingo:item_detection/items/map
#
# Triggered when the player obtains a minecraft:map
#
# @within advancement bingo:item_detection/map
# @handles advancement bingo:item_detection/map

#>
# @private
#declare score_holder $item_detect/map.success

execute store success score $item_detect/map.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:map"}}]
execute if score $item_detect/map.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce