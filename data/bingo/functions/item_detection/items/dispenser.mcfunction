#> bingo:item_detection/items/dispenser
#
# Triggered when the player obtains a minecraft:dispenser
#
# @within advancement bingo:item_detection/dispenser
# @handles advancement bingo:item_detection/dispenser

#>
# @private
#declare score_holder $item_detect/dispenser.success

execute store success score $item_detect/dispenser.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:dispenser"}}]
execute if score $item_detect/dispenser.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce