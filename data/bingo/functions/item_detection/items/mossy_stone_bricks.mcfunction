#> bingo:item_detection/items/mossy_stone_bricks
#
# Triggered when the player obtains a minecraft:mossy_stone_bricks
#
# @within advancement bingo:item_detection/mossy_stone_bricks
# @handles advancement bingo:item_detection/mossy_stone_bricks

#>
# @private
#declare score_holder $item_detect/mossy_stone_bricks.success

execute store success score $item_detect/mossy_stone_bricks.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:mossy_stone_bricks"}}]
execute if score $item_detect/mossy_stone_bricks.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce