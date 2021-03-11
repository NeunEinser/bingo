#> bingo:item_detection/items/glass_bottle
#
# Triggered when the player obtains a minecraft:glass_bottle
#
# @within advancement bingo:item_detection/glass_bottle
# @handles advancement bingo:item_detection/glass_bottle

#>
# @private
#declare score_holder $item_detect/glass_bottle.success

execute store success score $item_detect/glass_bottle.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:glass_bottle"}}] run data modify storage bingo:card slots[{item:{id:"bingo:glass_bottle"}}].selected set value true
execute if score $item_detect/glass_bottle.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce