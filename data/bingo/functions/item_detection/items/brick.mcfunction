#> bingo:item_detection/items/brick
#
# Triggered when the player obtains a minecraft:brick
#
# @within advancement bingo:item_detection/brick
# @handles advancement bingo:item_detection/brick

#>
# @private
#declare score_holder $item_detect/brick.success

execute store success score $item_detect/brick.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:brick"}}]
execute if score $item_detect/brick.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce