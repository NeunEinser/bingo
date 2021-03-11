#> bingo:item_detection/items/salmon
#
# Triggered when the player obtains a minecraft:salmon
#
# @within advancement bingo:item_detection/salmon
# @handles advancement bingo:item_detection/salmon

#>
# @private
#declare score_holder $item_detect/salmon.success

execute store success score $item_detect/salmon.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:salmon"}}]
execute if score $item_detect/salmon.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce