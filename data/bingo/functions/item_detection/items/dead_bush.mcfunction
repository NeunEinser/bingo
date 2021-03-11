#> bingo:item_detection/items/dead_bush
#
# Triggered when the player obtains a minecraft:dead_bush
#
# @within advancement bingo:item_detection/dead_bush
# @handles advancement bingo:item_detection/dead_bush

#>
# @private
#declare score_holder $item_detect/dead_bush.success

execute store success score $item_detect/dead_bush.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:dead_bush"}}] run data modify storage bingo:card slots[{item:{id:"bingo:dead_bush"}}].selected set value true
execute if score $item_detect/dead_bush.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce