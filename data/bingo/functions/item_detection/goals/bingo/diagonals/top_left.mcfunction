#> bingo:item_detection/goals/bingo/diagonals/top_left
#
# @within function bingo:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

#>
# @within
# 	function bingo:item_detection/goals/bingo/diagonals/top_left
# 	function bingo:item_detection/goals/bingo/diagonals/top/*
#declare storage tmp.bingo:item_detect/bingo/diagonal/top_left

#>
# @private
#declare score_holder $item_detect/bingo/diagonal/tl/1.success

data modify storage tmp.bingo:item_detect/bingo/diagonal/top_left icon set value '"\\uFFFF"'
execute store success score $item_detect/bingo/diagonal/tl/1.success bingo.tmp run data modify storage tmp.bingo:item_detect/bingo/diagonal/top_left icon set from storage bingo:card teams[-1].slots[0]
execute if score $item_detect/bingo/diagonal/tl/1.success bingo.tmp matches 1 run function bingo:item_detection/goals/bingo/diagonals/top/2