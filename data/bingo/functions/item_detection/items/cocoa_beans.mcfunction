#> bingo:item_detection/items/cocoa_beans
#
# Triggered when the player obtains a minecraft:cocoa_beans
#
# @within advancement bingo:item_detection/cocoa_beans
# @handles advancement bingo:item_detection/cocoa_beans

#>
# @private
#declare score_holder $item_detect/cocoa_beans.success

execute store success score $item_detect/cocoa_beans.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:cocoa_beans"}}]
execute if score $item_detect/cocoa_beans.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce