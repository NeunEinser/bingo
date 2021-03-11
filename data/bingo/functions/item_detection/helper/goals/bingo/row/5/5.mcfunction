#> bingo:item_detection/helper/goals/bingo/row/5/5
#
# @within function bingo:item_detection/helper/goals/bingo/row/5/4

#>
# @private
#declare score_holder $item_detect/bingo/row/5/5.success

execute store success score $item_detect/bingo/row/5/5.success bingo.tmp run data modify storage temp:bingo.item_detect/bingo/row/5 icon set from storage bingo:card teams[-1].slots[24]
execute if score $item_detect/bingo/row/5/5.success bingo.tmp matches 0 run scoreboard players set $item_detect/bingo.row bingo.tmp 5