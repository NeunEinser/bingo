#> bingo:item_detection/items/ink_sac
#
# Triggered when the player obtains a minecraft:ink_sac
#
# @within advancement bingo:item_detection/ink_sac
# @handles advancement bingo:item_detection/ink_sac

#>
# @private
#declare score_holder $item_detect/ink_sac.success

execute store success score $item_detect/ink_sac.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:ink_sac"}}] run data modify storage bingo:card slots[{item:{id:"bingo:ink_sac"}}].selected set value true
execute if score $item_detect/ink_sac.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce