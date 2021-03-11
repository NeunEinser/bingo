#> bingo:item_detection/items/map
#
# Triggered when the player obtains a minecraft:map
#
# @within advancement bingo:item_detection/map
# @handles advancement bingo:item_detection/map

#>
# @private
#declare score_holder $item_detect/map.success

execute store success score $item_detect/map.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:map"}}] run data modify storage bingo:card slots[{item:{id:"bingo:map"}}].selected set value true
execute if score $item_detect/map.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce