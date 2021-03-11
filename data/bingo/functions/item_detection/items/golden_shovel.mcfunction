#> bingo:item_detection/items/golden_shovel
#
# Triggered when the player obtains a minecraft:golden_shovel
#
# @within advancement bingo:item_detection/golden_shovel
# @handles advancement bingo:item_detection/golden_shovel

#>
# @private
#declare score_holder $item_detect/golden_shovel.success

execute store success score $item_detect/golden_shovel.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:golden_shovel"}}] run data modify storage bingo:card slots[{item:{id:"bingo:golden_shovel"}}].selected set value true
execute if score $item_detect/golden_shovel.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce