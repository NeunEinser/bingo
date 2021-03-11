#> bingo:item_detection/items/tropical_fish
#
# Triggered when the player obtains a minecraft:tropical_fish
#
# @within advancement bingo:item_detection/tropical_fish
# @handles advancement bingo:item_detection/tropical_fish

#>
# @private
#declare score_holder $item_detect/tropical_fish.success

execute store success score $item_detect/tropical_fish.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:tropical_fish"}}]
execute if score $item_detect/tropical_fish.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce