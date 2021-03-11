#> bingo:item_detection/items/seagrass
#
# Triggered when the player obtains a minecraft:seagrass
#
# @within advancement bingo:item_detection/seagrass
# @handles advancement bingo:item_detection/seagrass

#>
# @private
#declare score_holder $item_detect/seagrass.success

execute store success score $item_detect/seagrass.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:seagrass"}}] run data modify storage bingo:card slots[{item:{id:"bingo:seagrass"}}].selected set value true
execute if score $item_detect/seagrass.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce