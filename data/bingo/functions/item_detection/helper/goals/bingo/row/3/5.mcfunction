#> bingo:item_detection/helper/goals/bingo/row/3/5
#
# @within function bingo:item_detection/helper/goals/bingo/row/3/4

#>
# @private
#declare score_holder $item_detect/bingo/row/3/5.success

execute store success score $item_detect/bingo/row/3/5.success bingo.tmp run data modify storage temp:bingo.item_detect/bingo/row/3 icon set from storage temp:bingo.item_detect/bingo/row/3 slots[14]
execute if score $item_detect/bingo/row/3/5.success bingo.tmp matches 0 run scoreboard players set $item_detect/bingo.row bingo.tmp 3