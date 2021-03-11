#> bingo:item_detection/items/flint_and_steel
#
# Triggered when the player obtains a minecraft:flint_and_steel
#
# @within advancement bingo:item_detection/flint_and_steel
# @handles advancement bingo:item_detection/flint_and_steel

#>
# @private
#declare score_holder $item_detect/flint_and_steel.success

execute store success score $item_detect/flint_and_steel.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:flint_and_steel"}}] run data modify storage bingo:card slots[{item:{id:"bingo:flint_and_steel"}}].selected set value true
execute if score $item_detect/flint_and_steel.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce