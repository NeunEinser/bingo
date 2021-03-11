#> bingo:item_detection/items/ender_pearl
#
# Triggered when the player obtains a minecraft:ender_pearl
#
# @within advancement bingo:item_detection/ender_pearl
# @handles advancement bingo:item_detection/ender_pearl

#>
# @private
#declare score_holder $item_detect/ender_pearl.success

execute store success score $item_detect/ender_pearl.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:ender_pearl"}}]
execute if score $item_detect/ender_pearl.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce