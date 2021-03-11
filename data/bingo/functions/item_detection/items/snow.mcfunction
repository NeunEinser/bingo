#> bingo:item_detection/items/snow
#
# Triggered when the player obtains a minecraft:snow
#
# @within advancement bingo:item_detection/snow
# @handles advancement bingo:item_detection/snow

#>
# @private
#declare score_holder $item_detect/snow.success

execute store success score $item_detect/snow.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:snow"}}] run data modify storage bingo:card slots[{item:{id:"bingo:snow"}}].selected set value true
execute if score $item_detect/snow.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce