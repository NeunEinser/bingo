#> bingo:item_detection/items/bell
#
# Triggered when the player obtains a minecraft:bell
#
# @within advancement bingo:item_detection/bell
# @handles advancement bingo:item_detection/bell

#>
# @private
#declare score_holder $item_detect/bell.success

execute store success score $item_detect/bell.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:bell"}}] run data modify storage bingo:card slots[{item:{id:"bingo:bell"}}].selected set value true
execute if score $item_detect/bell.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce