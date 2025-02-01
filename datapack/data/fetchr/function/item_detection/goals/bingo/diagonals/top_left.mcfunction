#> fetchr:item_detection/goals/bingo/diagonals/top_left
#
# @within function fetchr:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

#>
# @within
# 	function fetchr:item_detection/goals/bingo/diagonals/top_left
# 	function fetchr:item_detection/goals/bingo/diagonals/top/*
#declare storage tmp.fetchr:item_detect/bingo/diagonal/top_left

#>
# @private
#declare score_holder $item_detect/bingo/diagonal/tl/1.success

#NEUN_SCRIPT until 65
#data modify storage tmp.fetchr:item_detect/bingo/diagonal/top_left icon set value '"\\uFFFF"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data modify storage tmp.fetchr:item_detect/bingo/diagonal/top_left icon set value "\uFFFF"
#NEUN_SCRIPT end
execute \
	store success score $item_detect/bingo/diagonal/tl/1.success fetchr.tmp \
	run data \
		modify storage tmp.fetchr:item_detect/bingo/diagonal/top_left icon \
		set from storage fetchr:card teams[-1].slots[0]
execute \
	if score $item_detect/bingo/diagonal/tl/1.success fetchr.tmp matches 1 \
	run function fetchr:item_detection/goals/bingo/diagonals/top/2