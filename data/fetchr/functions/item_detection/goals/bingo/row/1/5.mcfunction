#> fetchr:item_detection/goals/bingo/row/1/5
#
# @within function fetchr:item_detection/goals/bingo/row/1/4

#>
# @private
#declare score_holder $item_detect/bingo/row/1/5.success

execute store success score $item_detect/bingo/row/1/5.success fetchr.tmp run data modify storage tmp.fetchr:item_detect/bingo/row/1 icon set from storage fetchr:card teams[-1].slots[4]
execute if score $item_detect/bingo/row/1/5.success fetchr.tmp matches 0 run scoreboard players set $item_detect/bingo.row fetchr.tmp 1