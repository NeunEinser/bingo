#> fetchr:item_detection/goals/bingo/row/2/5
#
# @within function fetchr:item_detection/goals/bingo/row/2/4

#>
# @private
#declare score_holder $item_detect/bingo/row/2/5.success

execute store success score $item_detect/bingo/row/2/5.success fetchr.tmp run data modify storage tmp.fetchr:item_detect/bingo/row/2 icon set from storage fetchr:card teams[-1].slots[9]
execute if score $item_detect/bingo/row/2/5.success fetchr.tmp matches 0 run scoreboard players set $item_detect/bingo.row fetchr.tmp 2