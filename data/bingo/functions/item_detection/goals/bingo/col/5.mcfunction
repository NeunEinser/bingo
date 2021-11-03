#> bingo:item_detection/goals/bingo/col/5
#
# @within function bingo:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

#>
# @within
# 	function bingo:item_detection/goals/bingo/col/5
# 	function bingo:item_detection/goals/bingo/col/5/*
#declare storage tmp.bingo:item_detect/bingo/col/5

#>
# @private
#declare score_holder $item_detect/bingo/col/5/1.success

data modify storage tmp.bingo:item_detect/bingo/col/5 icon set value '"\\uFFFF"'
execute store success score $item_detect/bingo/col/5/1.success bingo.tmp run data modify storage tmp.bingo:item_detect/bingo/col/5 icon set from storage bingo:card teams[-1].slots[4]
execute if score $item_detect/bingo/col/5/1.success bingo.tmp matches 1 run function bingo:item_detection/goals/bingo/col/5/2