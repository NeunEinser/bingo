#> bingo:item_detection/items/glass_bottle
#
# Triggered when the player obtains a minecraft:glass_bottle
#
# @within advancement bingo:item_detection/glass_bottle
# @handles advancement bingo:item_detection/glass_bottle

#>
# @private
#declare score_holder $item_detect/glass_bottle.success

execute store success score $item_detect/glass_bottle.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:glass_bottle"}}]
execute if score $item_detect/glass_bottle.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce