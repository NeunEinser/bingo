#> bingo:item_detection/items/iron_block
#
# Triggered when the player obtains a minecraft:iron_block
#
# @within advancement bingo:item_detection/iron_block
# @handles advancement bingo:item_detection/iron_block

#>
# @private
#declare score_holder $item_detect/iron_block.success

execute store success score $item_detect/iron_block.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:iron_block"}}] run data modify storage bingo:card slots[{item:{id:"bingo:iron_block"}}].selected set value true
execute if score $item_detect/iron_block.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce