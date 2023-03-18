#> fetchr:item_detection/goals/bingo/col/4
#
# @within function fetchr:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

#>
# @within
# 	function fetchr:item_detection/goals/bingo/col/4
# 	function fetchr:item_detection/goals/bingo/col/4/*
#declare storage tmp.fetchr:item_detect/bingo/col/4

#>
# @private
#declare score_holder $item_detect/bingo/col/4/1.success

data modify storage tmp.fetchr:item_detect/bingo/col/4 icon set value '"\\uFFFF"'
execute store success score $item_detect/bingo/col/4/1.success fetchr.tmp run data modify storage tmp.fetchr:item_detect/bingo/col/4 icon set from storage fetchr:card teams[-1].slots[3]
execute if score $item_detect/bingo/col/4/1.success fetchr.tmp matches 1 run function fetchr:item_detection/goals/bingo/col/4/2