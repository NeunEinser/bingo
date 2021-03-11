#> bingo:item_detection/items/furnace_minecart
#
# Triggered when the player obtains a minecraft:furnace_minecart
#
# @within advancement bingo:item_detection/furnace_minecart
# @handles advancement bingo:item_detection/furnace_minecart

#>
# @private
#declare score_holder $item_detect/furnace_minecart.success

execute store success score $item_detect/furnace_minecart.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:furnace_minecart"}}]
execute if score $item_detect/furnace_minecart.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce