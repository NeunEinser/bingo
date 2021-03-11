#> bingo:item_detection/items/firework_rocket
#
# Triggered when the player obtains a minecraft:firework_rocket
#
# @within advancement bingo:item_detection/firework_rocket
# @handles advancement bingo:item_detection/firework_rocket

#>
# @private
#declare score_holder $item_detect/firework_rocket.success

execute store success score $item_detect/firework_rocket.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:firework_rocket"}}] run data modify storage bingo:card slots[{item:{id:"bingo:firework_rocket"}}].selected set value true
execute if score $item_detect/firework_rocket.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce