#> bingo:item_detection/items/saddle
#
# Triggered when the player obtains a minecraft:saddle
#
# @within advancement bingo:item_detection/saddle
# @handles advancement bingo:item_detection/saddle

#>
# @private
#declare score_holder $item_detect/saddle.success

execute store success score $item_detect/saddle.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:saddle"}}]
execute if score $item_detect/saddle.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce