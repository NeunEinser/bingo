#> fetchr:item_detection/goals/bingo/diagonals/bottom/5
#
# @within function fetchr:item_detection/goals/bingo/diagonals/bottom/4

#>
# @private
#declare score_holder $item_detect/bingo/diagonal/bl/5.success

execute store success score $item_detect/bingo/diagonal/bl/5.success fetchr.tmp run data modify storage tmp.fetchr:item_detect/bingo/diagonal/bottom_left icon set from storage fetchr:card teams[-1].slots[20]
execute if score $item_detect/bingo/diagonal/bl/5.success fetchr.tmp matches 0 run scoreboard players add $item_detect/bingo.diagonal fetchr.tmp 2