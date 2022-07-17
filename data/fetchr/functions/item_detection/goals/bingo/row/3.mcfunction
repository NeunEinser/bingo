#> fetchr:item_detection/goals/bingo/row/3
#
# @within function fetchr:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

#>
# @within
# 	function fetchr:item_detection/goals/bingo/row/3
# 	function fetchr:item_detection/goals/bingo/row/3/*
#declare storage tmp.fetchr:item_detect/bingo/row/3

#>
# @private
#declare score_holder $item_detect/bingo/row/3/1.success

data modify storage tmp.fetchr:item_detect/bingo/row/3 icon set value '"\\uFFFF"'
execute store success score $item_detect/bingo/row/3/1.success fetchr.tmp run data modify storage tmp.fetchr:item_detect/bingo/row/3 icon set from storage fetchr:card teams[-1].slots[10]
execute if score $item_detect/bingo/row/3/1.success fetchr.tmp matches 1 run function fetchr:item_detection/goals/bingo/row/3/2