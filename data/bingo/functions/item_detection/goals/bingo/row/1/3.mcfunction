#> bingo:item_detection/goals/bingo/row/1/3
#
# @within function bingo:item_detection/goals/bingo/row/1/2

#>
# @private
#declare score_holder $item_detect/bingo/row/1/3.success

execute store success score $item_detect/bingo/row/1/3.success bingo.tmp run data modify storage temp:bingo.item_detect/bingo/row/1 icon set from storage bingo:card teams[-1].slots[2]
execute if score $item_detect/bingo/row/1/3.success bingo.tmp matches 0 run function bingo:item_detection/goals/bingo/row/1/4