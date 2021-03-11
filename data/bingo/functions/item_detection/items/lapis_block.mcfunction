#> bingo:item_detection/items/lapis_block
#
# Triggered when the player obtains a minecraft:lapis_block
#
# @within advancement bingo:item_detection/lapis_block
# @handles advancement bingo:item_detection/lapis_block

#>
# @private
#declare score_holder $item_detect/lapis_block.success

execute store success score $item_detect/lapis_block.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:lapis_block"}}]
execute if score $item_detect/lapis_block.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce