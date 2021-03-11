#> bingo:item_detection/items/gunpowder
#
# Triggered when the player obtains a minecraft:gunpowder
#
# @within advancement bingo:item_detection/gunpowder
# @handles advancement bingo:item_detection/gunpowder

#>
# @private
#declare score_holder $item_detect/gunpowder.success

execute store success score $item_detect/gunpowder.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:gunpowder"}}] run data modify storage bingo:card slots[{item:{id:"bingo:gunpowder"}}].selected set value true
execute if score $item_detect/gunpowder.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce