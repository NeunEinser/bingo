#> fetchr:item_detection/goals/bingo/row/5/4
#
# @within function fetchr:item_detection/goals/bingo/row/5/3

#>
# @private
#declare score_holder $item_detect/bingo/row/5/4.success

execute store success score $item_detect/bingo/row/5/4.success fetchr.tmp run data modify storage tmp.fetchr:item_detect/bingo/row/5 icon set from storage fetchr:card teams[-1].slots[23]
execute if score $item_detect/bingo/row/5/4.success fetchr.tmp matches 0 run function fetchr:item_detection/goals/bingo/row/5/5