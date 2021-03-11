#> bingo:item_detection/items/crossbow
#
# Triggered when the player obtains a minecraft:crossbow
#
# @within advancement bingo:item_detection/crossbow
# @handles advancement bingo:item_detection/crossbow

#>
# @private
#declare score_holder $item_detect/crossbow.success

execute store success score $item_detect/crossbow.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:crossbow"}}]
execute if score $item_detect/crossbow.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce