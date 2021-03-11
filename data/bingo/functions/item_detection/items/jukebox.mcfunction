#> bingo:item_detection/items/jukebox
#
# Triggered when the player obtains a minecraft:jukebox
#
# @within advancement bingo:item_detection/jukebox
# @handles advancement bingo:item_detection/jukebox

#>
# @private
#declare score_holder $item_detect/jukebox.success

execute store success score $item_detect/jukebox.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:jukebox"}}]
execute if score $item_detect/jukebox.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce