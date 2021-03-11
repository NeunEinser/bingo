#> bingo:item_detection/items/golden_axe
#
# Triggered when the player obtains a minecraft:golden_axe
#
# @within advancement bingo:item_detection/golden_axe
# @handles advancement bingo:item_detection/golden_axe

#>
# @private
#declare score_holder $item_detect/golden_axe.success

execute store success score $item_detect/golden_axe.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:golden_axe"}}] run data modify storage bingo:card slots[{item:{id:"bingo:golden_axe"}}].selected set value true
execute if score $item_detect/golden_axe.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce