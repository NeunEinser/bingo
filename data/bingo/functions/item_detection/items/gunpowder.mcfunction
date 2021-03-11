#> bingo:item_detection/items/gunpowder
#
# Triggered when the player obtains a minecraft:gunpowder
#
# @within advancement bingo:item_detection/gunpowder
# @handles advancement bingo:item_detection/gunpowder

#>
# @private
#declare score_holder $item_detect/gunpowder.success

execute store success score $item_detect/gunpowder.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:gunpowder"}}]
execute if score $item_detect/gunpowder.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce