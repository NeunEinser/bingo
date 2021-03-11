#> bingo:item_detection/items/activator_rail
#
# Triggered when the player obtains a minecraft:activator_rail
#
# @within advancement bingo:item_detection/activator_rail
# @handles advancement bingo:item_detection/activator_rail

#>
# @private
#declare score_holder $item_detect/activator_rail.success

execute store success score $item_detect/activator_rail.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:activator_rail"}}]
execute if score $item_detect/activator_rail.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce