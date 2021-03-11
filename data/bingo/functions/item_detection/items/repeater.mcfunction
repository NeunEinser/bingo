#> bingo:item_detection/items/repeater
#
# Triggered when the player obtains a minecraft:repeater
#
# @within advancement bingo:item_detection/repeater
# @handles advancement bingo:item_detection/repeater

#>
# @private
#declare score_holder $item_detect/repeater.success

execute store success score $item_detect/repeater.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:repeater"}}]
execute if score $item_detect/repeater.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce