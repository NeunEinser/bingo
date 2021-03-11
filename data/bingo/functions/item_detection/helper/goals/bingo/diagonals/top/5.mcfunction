#> bingo:item_detection/helper/goals/bingo/diagonals/top/5
#
# @within function bingo:item_detection/helper/goals/bingo/diagonals/top/4

#>
# @private
#declare score_holder $item_detect/bingo/diagonal/tl/5.success

execute store success score $item_detect/bingo/diagonal/tl/5.success bingo.tmp run data modify storage temp:bingo.item_detect/bingo/diagonal/top_left icon set from storage temp:bingo.item_detect/bingo/diagonal/top_left slots[24]
execute if score $item_detect/bingo/diagonal/tl/5.success bingo.tmp matches 0 run scoreboard players add $item_detect/bingo.diagonal bingo.tmp 1