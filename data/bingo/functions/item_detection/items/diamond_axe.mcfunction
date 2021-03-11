#> bingo:item_detection/items/diamond_axe
#
# Triggered when the player obtains a minecraft:diamond_axe
#
# @within advancement bingo:item_detection/diamond_axe
# @handles advancement bingo:item_detection/diamond_axe

#>
# @private
#declare score_holder $item_detect/diamond_axe.success

execute store success score $item_detect/diamond_axe.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:diamond_axe"}}] run data modify storage bingo:card slots[{item:{id:"bingo:diamond_axe"}}].selected set value true
execute if score $item_detect/diamond_axe.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce