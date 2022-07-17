#> fetchr:item_detection/goals/bingo/col/2/4
#
# @within function fetchr:item_detection/goals/bingo/col/2/3

#>
# @private
#declare score_holder $item_detect/bingo/col/2/4.success

execute store success score $item_detect/bingo/col/2/4.success fetchr.tmp run data modify storage tmp.fetchr:item_detect/bingo/col/2 icon set from storage fetchr:card teams[-1].slots[16]
execute if score $item_detect/bingo/col/2/4.success fetchr.tmp matches 0 run function fetchr:item_detection/goals/bingo/col/2/5