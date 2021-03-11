#> bingo:item_detection/items/detector_rail
#
# Triggered when the player obtains a minecraft:detector_rail
#
# @within advancement bingo:item_detection/detector_rail
# @handles advancement bingo:item_detection/detector_rail

#>
# @private
#declare score_holder $item_detect/detector_rail.success

execute store success score $item_detect/detector_rail.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:detector_rail"}}] run data modify storage bingo:card slots[{item:{id:"bingo:detector_rail"}}].selected set value true
execute if score $item_detect/detector_rail.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce