#> bingo:item_detection/helper/goals/bingo/row/1/4
#
# @within function bingo:item_detection/helper/goals/bingo/row/1/3

#>
# @private
#declare score_holder $item_detect/bingo/row/1/4.success

execute store success score $item_detect/bingo/row/1/4.success bingo.tmp run data modify storage temp:bingo.item_detect/bingo/row/1 icon set from storage temp:bingo.item_detect/bingo/row/1 slots[3]
execute if score $item_detect/bingo/row/1/4.success bingo.tmp matches 1 run function bingo:item_detection/helper/goals/bingo/row/1/5