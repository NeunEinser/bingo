#> bingo:item_detection/items/tropical_fish_bucket
#
# Triggered when the player obtains a minecraft:tropical_fish_bucket
#
# @within advancement bingo:item_detection/tropical_fish_bucket
# @handles advancement bingo:item_detection/tropical_fish_bucket

#>
# @private
#declare score_holder $item_detect/tropical_fish_buck.success

execute store success score $item_detect/tropical_fish_buck.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:tropical_fish_bucket"}}]
execute if score $item_detect/tropical_fish_buck.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce