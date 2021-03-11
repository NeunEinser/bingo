#> bingo:item_detection/items/pumpkin_pie
#
# Triggered when the player obtains a minecraft:pumpkin_pie
#
# @within advancement bingo:item_detection/pumpkin_pie
# @handles advancement bingo:item_detection/pumpkin_pie

#>
# @private
#declare score_holder $item_detect/pumpkin_pie.success

execute store success score $item_detect/pumpkin_pie.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:pumpkin_pie"}}] run data modify storage bingo:card slots[{item:{id:"bingo:pumpkin_pie"}}].selected set value true
execute if score $item_detect/pumpkin_pie.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce