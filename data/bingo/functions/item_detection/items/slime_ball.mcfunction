#> bingo:item_detection/items/slime_ball
#
# Triggered when the player obtains a minecraft:slime_ball
#
# @within advancement bingo:item_detection/slime_ball
# @handles advancement bingo:item_detection/slime_ball

#>
# @private
#declare score_holder $item_detect/slime_ball.success

execute store success score $item_detect/slime_ball.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:slime_ball"}}]
execute if score $item_detect/slime_ball.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce