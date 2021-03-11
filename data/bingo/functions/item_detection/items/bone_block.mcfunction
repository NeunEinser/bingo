#> bingo:item_detection/items/bone_block
#
# Triggered when the player obtains a minecraft:bone_block
#
# @within advancement bingo:item_detection/bone_block
# @handles advancement bingo:item_detection/bone_block

#>
# @private
#declare score_holder $item_detect/bone_block.success

execute store success score $item_detect/bone_block.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:bone_block"}}]
execute if score $item_detect/bone_block.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce