#> fetchr:item_detection/goals/bingo/row/3/3
#
# @within function fetchr:item_detection/goals/bingo/row/3/2

#>
# @private
#declare score_holder $item_detect/bingo/row/3/3.success

execute store success score $item_detect/bingo/row/3/3.success fetchr.tmp run data modify storage tmp.fetchr:item_detect/bingo/row/3 icon set from storage fetchr:card teams[-1].slots[12]
execute if score $item_detect/bingo/row/3/3.success fetchr.tmp matches 0 run function fetchr:item_detection/goals/bingo/row/3/4