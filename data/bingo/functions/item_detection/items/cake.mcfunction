#> bingo:item_detection/items/cake
#
# Triggered when the player obtains a minecraft:cake
#
# @within advancement bingo:item_detection/cake
# @handles advancement bingo:item_detection/cake

#>
# @private
#declare score_holder $item_detect/cake.success

execute store success score $item_detect/cake.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:cake"}}]
execute if score $item_detect/cake.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce