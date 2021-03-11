#> bingo:item_detection/items/diamond_shovel
#
# Triggered when the player obtains a minecraft:diamond_shovel
#
# @within advancement bingo:item_detection/diamond_shovel
# @handles advancement bingo:item_detection/diamond_shovel

#>
# @private
#declare score_holder $item_detect/diamond_shovel.success

execute store success score $item_detect/diamond_shovel.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:diamond_shovel"}}] run data modify storage bingo:card slots[{item:{id:"bingo:diamond_shovel"}}].selected set value true
execute if score $item_detect/diamond_shovel.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce