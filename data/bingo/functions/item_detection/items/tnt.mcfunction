#> bingo:item_detection/items/tnt
#
# Triggered when the player obtains a minecraft:tnt
#
# @within advancement bingo:item_detection/tnt
# @handles advancement bingo:item_detection/tnt

#>
# @private
#declare score_holder $item_detect/tnt.success

execute store success score $item_detect/tnt.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:tnt"}}] run data modify storage bingo:card slots[{item:{id:"bingo:tnt"}}].selected set value true
execute if score $item_detect/tnt.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce