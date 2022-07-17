#> fetchr:item_detection/goals/bingo/col/5/2
#
# @within function fetchr:item_detection/goals/bingo/col/5

#>
# @private
#declare score_holder $item_detect/bingo/col/5/2.success

execute store success score $item_detect/bingo/col/5/2.success fetchr.tmp run data modify storage tmp.fetchr:item_detect/bingo/col/5 icon set from storage fetchr:card teams[-1].slots[9]
execute if score $item_detect/bingo/col/5/2.success fetchr.tmp matches 0 run function fetchr:item_detection/goals/bingo/col/5/3