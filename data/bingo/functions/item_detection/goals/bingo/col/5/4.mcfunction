#> bingo:item_detection/goals/bingo/col/5/4
#
# @within function bingo:item_detection/goals/bingo/col/5/3

#>
# @private
#declare score_holder $item_detect/bingo/col/5/4.success

execute store success score $item_detect/bingo/col/5/4.success bingo.tmp run data modify storage tmp.bingo:item_detect/bingo/col/5 icon set from storage bingo:card teams[-1].slots[19]
execute if score $item_detect/bingo/col/5/4.success bingo.tmp matches 0 run function bingo:item_detection/goals/bingo/col/5/5