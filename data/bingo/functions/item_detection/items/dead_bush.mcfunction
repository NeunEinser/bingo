#> bingo:item_detection/items/dead_bush
#
# Triggered when the player obtains a minecraft:dead_bush
#
# @within advancement bingo:item_detection/dead_bush
# @handles advancement bingo:item_detection/dead_bush

#>
# @private
#declare score_holder $item_detect/dead_bush.success

execute store success score $item_detect/dead_bush.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:dead_bush"}}]
execute if score $item_detect/dead_bush.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce