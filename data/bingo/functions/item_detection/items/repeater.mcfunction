#> bingo:item_detection/items/repeater
#
# Triggered when the player obtains a minecraft:repeater
#
# @within advancement bingo:item_detection/repeater
# @handles advancement bingo:item_detection/repeater

#>
# @private
#declare score_holder $item_detect/repeater.success

execute store success score $item_detect/repeater.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:repeater"}}] run data modify storage bingo:card slots[{item:{id:"bingo:repeater"}}].selected set value true
execute if score $item_detect/repeater.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce