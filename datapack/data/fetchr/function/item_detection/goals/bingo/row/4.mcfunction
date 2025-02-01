#> fetchr:item_detection/goals/bingo/row/4
#
# @within function fetchr:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

#>
# @within
# 	function fetchr:item_detection/goals/bingo/row/4
# 	function fetchr:item_detection/goals/bingo/row/4/*
#declare storage tmp.fetchr:item_detect/bingo/row/4

#>
# @private
#declare score_holder $item_detect/bingo/row/4/1.success

#NEUN_SCRIPT until 65
#data modify storage tmp.fetchr:item_detect/bingo/row/4 icon set value '"\\uFFFF"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data modify storage tmp.fetchr:item_detect/bingo/row/4 icon set value "\uFFFF"
#NEUN_SCRIPT end
execute store success score $item_detect/bingo/row/4/1.success fetchr.tmp run data modify storage tmp.fetchr:item_detect/bingo/row/4 icon set from storage fetchr:card teams[-1].slots[15]
execute if score $item_detect/bingo/row/4/1.success fetchr.tmp matches 1 run function fetchr:item_detection/goals/bingo/row/4/2