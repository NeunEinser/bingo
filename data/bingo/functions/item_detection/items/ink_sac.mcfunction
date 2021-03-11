#> bingo:item_detection/items/ink_sac
#
# Triggered when the player obtains a minecraft:ink_sac
#
# @within advancement bingo:item_detection/ink_sac
# @handles advancement bingo:item_detection/ink_sac

#>
# @private
#declare score_holder $item_detect/ink_sac.success

execute store success score $item_detect/ink_sac.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:ink_sac"}}]
execute if score $item_detect/ink_sac.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce