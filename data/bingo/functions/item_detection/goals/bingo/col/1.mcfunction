#> bingo:item_detection/goals/bingo/col/1
#
# @within function bingo:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

#>
# @within
# 	function bingo:item_detection/goals/bingo/col/1
# 	function bingo:item_detection/goals/bingo/col/1/*
#declare storage tmp.bingo:item_detect/bingo/col/1

#>
# @private
#declare score_holder $item_detect/bingo/col/1/1.success

data modify storage tmp.bingo:item_detect/bingo/col/1 icon set value '"\\uFFFF"'
execute store success score $item_detect/bingo/col/1/1.success bingo.tmp run data modify storage tmp.bingo:item_detect/bingo/col/1 icon set from storage bingo:card teams[-1].slots[0]
execute if score $item_detect/bingo/col/1/1.success bingo.tmp matches 1 run function bingo:item_detection/goals/bingo/col/1/2