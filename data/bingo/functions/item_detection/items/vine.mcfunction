#> bingo:item_detection/items/vine
#
# Triggered when the player obtains a minecraft:vine
#
# @within advancement bingo:item_detection/vine
# @handles advancement bingo:item_detection/vine

#>
# @private
#declare score_holder $item_detect/vine.success

execute store success score $item_detect/vine.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:vine"}}] run data modify storage bingo:card slots[{item:{id:"bingo:vine"}}].selected set value true
execute if score $item_detect/vine.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce