#> bingo:item_detection/items/diamond_pickaxe
#
# Triggered when the player obtains a minecraft:diamond_pickaxe
#
# @within advancement bingo:item_detection/diamond_pickaxe
# @handles advancement bingo:item_detection/diamond_pickaxe

#>
# @private
#declare score_holder $item_detect/diamond_pickaxe.success

execute store success score $item_detect/diamond_pickaxe.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:diamond_pickaxe"}}] run data modify storage bingo:card slots[{item:{id:"bingo:diamond_pickaxe"}}].selected set value true
execute if score $item_detect/diamond_pickaxe.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce