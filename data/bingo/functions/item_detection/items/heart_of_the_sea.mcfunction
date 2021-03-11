#> bingo:item_detection/items/heart_of_the_sea
#
# Triggered when the player obtains a minecraft:heart_of_the_sea
#
# @within advancement bingo:item_detection/heart_of_the_sea
# @handles advancement bingo:item_detection/heart_of_the_sea

#>
# @private
#declare score_holder $item_detect/heart_of_the_sea.success

execute store success score $item_detect/heart_of_the_sea.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:heart_of_the_sea"}}] run data modify storage bingo:card slots[{item:{id:"bingo:heart_of_the_sea"}}].selected set value true
execute if score $item_detect/heart_of_the_sea.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce