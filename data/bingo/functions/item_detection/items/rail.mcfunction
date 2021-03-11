#> bingo:item_detection/items/rail
#
# Triggered when the player obtains a minecraft:rail
#
# @within advancement bingo:item_detection/rail
# @handles advancement bingo:item_detection/rail

#>
# @private
#declare score_holder $item_detect/rail.success

execute store success score $item_detect/rail.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:rail"}}] run data modify storage bingo:card slots[{item:{id:"bingo:rail"}}].selected set value true
execute if score $item_detect/rail.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce