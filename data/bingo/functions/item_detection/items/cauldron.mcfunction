#> bingo:item_detection/items/cauldron
#
# Triggered when the player obtains a minecraft:cauldron
#
# @within advancement bingo:item_detection/cauldron
# @handles advancement bingo:item_detection/cauldron

#>
# @private
#declare score_holder $item_detect/cauldron.success

execute store success score $item_detect/cauldron.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:cauldron"}}] run data modify storage bingo:card slots[{item:{id:"bingo:cauldron"}}].selected set value true
execute if score $item_detect/cauldron.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce