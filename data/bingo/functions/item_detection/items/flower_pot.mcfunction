#> bingo:item_detection/items/flower_pot
#
# Triggered when the player obtains a minecraft:flower_pot
#
# @within advancement bingo:item_detection/flower_pot
# @handles advancement bingo:item_detection/flower_pot

#>
# @private
#declare score_holder $item_detect/flower_pot.success

execute store success score $item_detect/flower_pot.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:flower_pot"}}]
execute if score $item_detect/flower_pot.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce