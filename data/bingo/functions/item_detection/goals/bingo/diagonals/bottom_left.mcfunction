#> bingo:item_detection/goals/bingo/diagonals/bottom_left
#
# @within function bingo:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

#>
# @within
# 	function bingo:item_detection/goals/bingo/diagonals/bottom_left
# 	function bingo:item_detection/goals/bingo/diagonals/bottom/*
#declare storage tmp.bingo:item_detect/bingo/diagonal/bottom_left

#>
# @private
#declare score_holder $item_detect/bingo/diagonal/bl/1.success

data modify storage tmp.bingo:item_detect/bingo/diagonal/bottom_left icon set value '"\\uFFFF"'
execute store success score $item_detect/bingo/diagonal/bl/1.success bingo.tmp run data modify storage tmp.bingo:item_detect/bingo/diagonal/bottom_left icon set from storage bingo:card teams[-1].slots[4]
execute if score $item_detect/bingo/diagonal/bl/1.success bingo.tmp matches 1 run function bingo:item_detection/goals/bingo/diagonals/bottom/2