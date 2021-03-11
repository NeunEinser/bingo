#> bingo:item_detection/items/cookie
#
# Triggered when the player obtains a minecraft:cookie
#
# @within advancement bingo:item_detection/cookie
# @handles advancement bingo:item_detection/cookie

#>
# @private
#declare score_holder $item_detect/cookie.success

execute store success score $item_detect/cookie.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:cookie"}}]
execute if score $item_detect/cookie.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce