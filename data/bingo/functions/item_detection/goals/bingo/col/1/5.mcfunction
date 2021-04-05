#> bingo:item_detection/goals/bingo/col/1/5
#
# @within function bingo:item_detection/goals/bingo/col/1/4

#>
# @private
#declare score_holder $item_detect/bingo/col/1/5.success

execute store success score $item_detect/bingo/col/1/5.success bingo.tmp run data modify storage temp:bingo.item_detect/bingo/col/1 icon set from storage bingo:card teams[-1].slots[20]
execute if score $item_detect/bingo/col/1/5.success bingo.tmp matches 0 run scoreboard players set $item_detect/bingo.column bingo.tmp 1