#> bingo:item_detection/items/clock
#
# Triggered when the player obtains a minecraft:clock
#
# @within advancement bingo:item_detection/clock
# @handles advancement bingo:item_detection/clock

#>
# @private
#declare score_holder $item_detect/clock.success

execute store success score $item_detect/clock.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:clock"}}]
execute if score $item_detect/clock.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce