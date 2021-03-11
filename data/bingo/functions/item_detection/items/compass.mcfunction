#> bingo:item_detection/items/compass
#
# Triggered when the player obtains a minecraft:compass
#
# @within advancement bingo:item_detection/compass
# @handles advancement bingo:item_detection/compass

#>
# @private
#declare score_holder $item_detect/compass.success

execute store success score $item_detect/compass.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:compass"}}] run data modify storage bingo:card slots[{item:{id:"bingo:compass"}}].selected set value true
execute if score $item_detect/compass.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce