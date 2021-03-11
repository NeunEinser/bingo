#> bingo:item_detection/items/bamboo
#
# Triggered when the player obtains a minecraft:bamboo
#
# @within advancement bingo:item_detection/bamboo
# @handles advancement bingo:item_detection/bamboo

#>
# @private
#declare score_holder $item_detect/bamboo.success

execute store success score $item_detect/bamboo.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:bamboo"}}] run data modify storage bingo:card slots[{item:{id:"bingo:bamboo"}}].selected set value true
execute if score $item_detect/bamboo.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce