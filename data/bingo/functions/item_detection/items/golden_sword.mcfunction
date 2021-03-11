#> bingo:item_detection/items/golden_sword
#
# Triggered when the player obtains a minecraft:golden_sword
#
# @within advancement bingo:item_detection/golden_sword
# @handles advancement bingo:item_detection/golden_sword

#>
# @private
#declare score_holder $item_detect/golden_sword.success

execute store success score $item_detect/golden_sword.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:golden_sword"}}] run data modify storage bingo:card slots[{item:{id:"bingo:golden_sword"}}].selected set value true
execute if score $item_detect/golden_sword.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce