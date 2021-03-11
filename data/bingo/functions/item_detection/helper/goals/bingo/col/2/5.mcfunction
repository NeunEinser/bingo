#> bingo:item_detection/helper/goals/bingo/col/2/5
#
# @within function bingo:item_detection/helper/goals/bingo/col/2/4

#>
# @private
#declare score_holder $item_detect/bingo/col/2/5.success

execute store success score $item_detect/bingo/col/2/5.success bingo.tmp run data modify storage temp:bingo.item_detect/bingo/col/2 icon set from storage temp:bingo.item_detect/bingo/col/2 slots[21]
execute if score $item_detect/bingo/col/2/5.success bingo.tmp matches 0 run scoreboard players set $item_detect/bingo.column bingo.tmp 2