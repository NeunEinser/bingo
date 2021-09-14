#> bingo:item_detection/goals/bingo/col/4/5
#
# @within function bingo:item_detection/goals/bingo/col/4/4

#>
# @private
#declare score_holder $item_detect/bingo/col/4/5.success

execute store success score $item_detect/bingo/col/4/5.success bingo.tmp run data modify storage tmp.bingo:item_detect/bingo/col/4 icon set from storage bingo:card teams[-1].slots[23]
execute if score $item_detect/bingo/col/4/5.success bingo.tmp matches 0 run scoreboard players set $item_detect/bingo.column bingo.tmp 4