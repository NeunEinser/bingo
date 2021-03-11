#> bingo:item_detection/items/golden_pickaxe
#
# Triggered when the player obtains a minecraft:golden_pickaxe
#
# @within advancement bingo:item_detection/golden_pickaxe
# @handles advancement bingo:item_detection/golden_pickaxe

#>
# @private
#declare score_holder $item_detect/golden_pickaxe.success

execute store success score $item_detect/golden_pickaxe.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:golden_pickaxe"}}] run data modify storage bingo:card slots[{item:{id:"bingo:golden_pickaxe"}}].selected set value true
execute if score $item_detect/golden_pickaxe.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce