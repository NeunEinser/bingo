#> bingo:item_detection/items/crossbow
#
# Triggered when the player obtains a minecraft:crossbow
#
# @within advancement bingo:item_detection/crossbow
# @handles advancement bingo:item_detection/crossbow

#>
# @private
#declare score_holder $item_detect/crossbow.success

execute store success score $item_detect/crossbow.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:crossbow"}}] run data modify storage bingo:card slots[{item:{id:"bingo:crossbow"}}].selected set value true
execute if score $item_detect/crossbow.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce