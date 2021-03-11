#> bingo:item_detection/items/painting
#
# Triggered when the player obtains a minecraft:painting
#
# @within advancement bingo:item_detection/painting
# @handles advancement bingo:item_detection/painting

#>
# @private
#declare score_holder $item_detect/painting.success

execute store success score $item_detect/painting.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:painting"}}] run data modify storage bingo:card slots[{item:{id:"bingo:painting"}}].selected set value true
execute if score $item_detect/painting.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce