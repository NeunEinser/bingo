#> bingo:item_detection/items/obsidian
#
# Triggered when the player obtains a minecraft:obsidian
#
# @within advancement bingo:item_detection/obsidian
# @handles advancement bingo:item_detection/obsidian

#>
# @private
#declare score_holder $item_detect/obsidian.success

execute store success score $item_detect/obsidian.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:obsidian"}}] run data modify storage bingo:card slots[{item:{id:"bingo:obsidian"}}].selected set value true
execute if score $item_detect/obsidian.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce