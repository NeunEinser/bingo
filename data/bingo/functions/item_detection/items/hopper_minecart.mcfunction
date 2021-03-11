#> bingo:item_detection/items/hopper_minecart
#
# Triggered when the player obtains a minecraft:hopper_minecart
#
# @within advancement bingo:item_detection/hopper_minecart
# @handles advancement bingo:item_detection/hopper_minecart

#>
# @private
#declare score_holder $item_detect/hopper_minecart.success

execute store success score $item_detect/hopper_minecart.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:hopper_minecart"}}] run data modify storage bingo:card slots[{item:{id:"bingo:hopper_minecart"}}].selected set value true
execute if score $item_detect/hopper_minecart.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce