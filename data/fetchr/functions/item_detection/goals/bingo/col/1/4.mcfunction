#> fetchr:item_detection/goals/bingo/col/1/4
#
# @within function fetchr:item_detection/goals/bingo/col/1/3

#>
# @private
#declare score_holder $item_detect/bingo/col/1/4.success

execute store success score $item_detect/bingo/col/1/4.success fetchr.tmp run data modify storage tmp.fetchr:item_detect/bingo/col/1 icon set from storage fetchr:card teams[-1].slots[15]
execute if score $item_detect/bingo/col/1/4.success fetchr.tmp matches 0 run function fetchr:item_detection/goals/bingo/col/1/5