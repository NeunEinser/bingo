#> fetchr:item_detection/goals/bingo/diagonals/bottom/2
#
# @within function fetchr:item_detection/goals/bingo/diagonals/bottom_left

#>
# @private
#declare score_holder $item_detect/bingo/diagonal/bl/2.success

execute store success score $item_detect/bingo/diagonal/bl/2.success fetchr.tmp run data modify storage tmp.fetchr:item_detect/bingo/diagonal/bottom_left icon set from storage fetchr:card teams[-1].slots[8]
execute if score $item_detect/bingo/diagonal/bl/2.success fetchr.tmp matches 0 run function fetchr:item_detection/goals/bingo/diagonals/bottom/3