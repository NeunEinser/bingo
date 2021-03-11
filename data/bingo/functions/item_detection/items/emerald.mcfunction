#> bingo:item_detection/items/emerald
#
# Triggered when the player obtains a minecraft:emerald
#
# @within advancement bingo:item_detection/emerald
# @handles advancement bingo:item_detection/emerald

#>
# @private
#declare score_holder $item_detect/emerald.success

execute store success score $item_detect/emerald.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:emerald"}}]
execute if score $item_detect/emerald.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce