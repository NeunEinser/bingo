#> bingo:item_detection/items/bone
#
# Triggered when the player obtains a minecraft:bone
#
# @within advancement bingo:item_detection/bone
# @handles advancement bingo:item_detection/bone

#>
# @private
#declare score_holder $item_detect/bone.success

execute store success score $item_detect/bone.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:bone"}}] run data modify storage bingo:card slots[{item:{id:"bingo:bone"}}].selected set value true
execute if score $item_detect/bone.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce