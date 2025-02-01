#> fetchr:item_detection/goals/bingo/row/2
#
# @within function fetchr:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

#>
# @within
# 	function fetchr:item_detection/goals/bingo/row/2
# 	function fetchr:item_detection/goals/bingo/row/2/*
#declare storage tmp.fetchr:item_detect/bingo/row/2

#>
# @private
#declare score_holder $item_detect/bingo/row/2/1.success

#NEUN_SCRIPT until 65
#data modify storage tmp.fetchr:item_detect/bingo/row/2 icon set value '"\\uFFFF"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data modify storage tmp.fetchr:item_detect/bingo/row/2 icon set value "\uFFFF"
#NEUN_SCRIPT end
execute store success score $item_detect/bingo/row/2/1.success fetchr.tmp run data modify storage tmp.fetchr:item_detect/bingo/row/2 icon set from storage fetchr:card teams[-1].slots[5]
execute if score $item_detect/bingo/row/2/1.success fetchr.tmp matches 1 run function fetchr:item_detection/goals/bingo/row/2/2