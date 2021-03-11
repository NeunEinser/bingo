#> bingo:item_detection/helper/goals/bingo/diagonals/bottom/4
#
# @within function bingo:item_detection/helper/goals/bingo/diagonals/bottom/3

#>
# @private
#declare score_holder $item_detect/bingo/diagonal/bl/4.success

execute store success score $item_detect/bingo/diagonal/bl/4.success bingo.tmp run data modify storage temp:bingo.item_detect/bingo/diagonal/bottom_left icon set from storage temp:bingo.item_detect/bingo/diagonal/bottom_left slots[16]
execute if score $item_detect/bingo/diagonal/bl/4.success bingo.tmp matches 0 run function bingo:item_detection/helper/goals/bingo/diagonals/bottom/5