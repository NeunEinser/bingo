#> bingo:item_detection/items/fern
#
# Triggered when the player obtains a minecraft:fern
#
# @within advancement bingo:item_detection/fern
# @handles advancement bingo:item_detection/fern

#>
# @private
#declare score_holder $item_detect/fern.success

execute store success score $item_detect/fern.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:fern"}}] run data modify storage bingo:card slots[{item:{id:"bingo:fern"}}].selected set value true
execute if score $item_detect/fern.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce