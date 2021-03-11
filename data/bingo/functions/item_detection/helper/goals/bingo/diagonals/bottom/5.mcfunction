#> bingo:item_detection/helper/goals/bingo/diagonals/bottom/5
#
# @within function bingo:item_detection/helper/goals/bingo/diagonals/bottom/4

#>
# @private
#declare score_holder $item_detect/bingo/diagonal/bl/5.success

execute store success score $item_detect/bingo/diagonal/bl/5.success bingo.tmp run data modify storage temp:bingo.item_detect/bingo/diagonal/bottom_left icon set from storage temp:bingo.item_detect/bingo/diagonal/bottom_left slots[20]
execute if score $item_detect/bingo/diagonal/bl/5.success bingo.tmp matches 0 run scoreboard players add $item_detect/bingo.diagonal bingo.tmp 2