#> bingo:item_detection/items/hopper
#
# Triggered when the player obtains a minecraft:hopper
#
# @within advancement bingo:item_detection/hopper
# @handles advancement bingo:item_detection/hopper

#>
# @private
#declare score_holder $item_detect/hopper.success

execute store success score $item_detect/hopper.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:hopper"}}] run data modify storage bingo:card slots[{item:{id:"bingo:hopper"}}].selected set value true
execute if score $item_detect/hopper.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce