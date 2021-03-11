#> bingo:item_detection/items/redstone_block
#
# Triggered when the player obtains a minecraft:redstone_block
#
# @within advancement bingo:item_detection/redstone_block
# @handles advancement bingo:item_detection/redstone_block

#>
# @private
#declare score_holder $item_detect/redstone_block.success

execute store success score $item_detect/redstone_block.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:redstone_block"}}]
execute if score $item_detect/redstone_block.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce