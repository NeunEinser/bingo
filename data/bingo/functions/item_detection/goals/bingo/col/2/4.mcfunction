#> bingo:item_detection/goals/bingo/col/2/4
#
# @within function bingo:item_detection/goals/bingo/col/2/3

#>
# @private
#declare score_holder $item_detect/bingo/col/2/4.success

execute store success score $item_detect/bingo/col/2/4.success bingo.tmp run data modify storage tmp.bingo:item_detect/bingo/col/2 icon set from storage bingo:card teams[-1].slots[16]
execute if score $item_detect/bingo/col/2/4.success bingo.tmp matches 0 run function bingo:item_detection/goals/bingo/col/2/5