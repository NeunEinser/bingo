#> bingo:item_detection/helper/goals/bingo/col/2/4
#
# @within function bingo:item_detection/helper/goals/bingo/col/2/3

#>
# @private
#declare score_holder $item_detect/bingo/col/2/4.success

execute store success score $item_detect/bingo/col/2/4.success bingo.tmp run data modify storage temp:bingo.item_detect/bingo/col/2 icon set from storage temp:bingo.item_detect/bingo/col/2 slots[16]
execute if score $item_detect/bingo/col/2/4.success bingo.tmp matches 1 run function bingo:item_detection/helper/goals/bingo/col/2/5