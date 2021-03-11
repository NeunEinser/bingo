#> bingo:item_detection/items/pumpkin_seeds
#
# Triggered when the player obtains a minecraft:pumpkin_seeds
#
# @within advancement bingo:item_detection/pumpkin_seeds
# @handles advancement bingo:item_detection/pumpkin_seeds

#>
# @private
#declare score_holder $item_detect/pumpkin_seeds.success

execute store success score $item_detect/pumpkin_seeds.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:pumpkin_seeds"}}]
execute if score $item_detect/pumpkin_seeds.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce