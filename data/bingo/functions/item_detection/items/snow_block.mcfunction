#> bingo:item_detection/items/snow_block
#
# Triggered when the player obtains a minecraft:snow_block
#
# @within advancement bingo:item_detection/snow_block
# @handles advancement bingo:item_detection/snow_block

#>
# @private
#declare score_holder $item_detect/snow_block.success

execute store success score $item_detect/snow_block.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:snow_block"}}]
execute if score $item_detect/snow_block.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce