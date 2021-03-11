#> bingo:item_detection/items/target
#
# Triggered when the player obtains a minecraft:target
#
# @within advancement bingo:item_detection/target
# @handles advancement bingo:item_detection/target

#>
# @private
#declare score_holder $item_detect/target.success

execute store success score $item_detect/target.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:target"}}] run data modify storage bingo:card slots[{item:{id:"bingo:target"}}].selected set value true
execute if score $item_detect/target.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce