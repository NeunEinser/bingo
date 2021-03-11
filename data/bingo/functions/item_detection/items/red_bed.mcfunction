#> bingo:item_detection/items/red_bed
#
# Triggered when the player obtains a minecraft:red_bed
#
# @within advancement bingo:item_detection/red_bed
# @handles advancement bingo:item_detection/red_bed

#>
# @private
#declare score_holder $item_detect/red_bed.success

execute store success score $item_detect/red_bed.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:red_bed"}}] run data modify storage bingo:card slots[{item:{id:"bingo:red_bed"}}].selected set value true
execute if score $item_detect/red_bed.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce