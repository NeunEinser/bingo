#> bingo:item_detection/helper/goals/bingo/row/2/2
#
# @within function bingo:item_detection/helper/goals/bingo/row/2

#>
# @private
#declare score_holder $item_detect/bingo/row/2/2.success

execute store success score $item_detect/bingo/row/2/2.success bingo.tmp run data modify storage temp:bingo.item_detect/bingo/row/2 icon set from storage temp:bingo.item_detect/bingo/row/2 slots[6]
execute if score $item_detect/bingo/row/2/2.success bingo.tmp matches 1 run function bingo:item_detection/helper/goals/bingo/row/2/3