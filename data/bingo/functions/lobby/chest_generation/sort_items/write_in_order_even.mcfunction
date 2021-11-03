#> bingo:lobby/chest_generation/sort_items/write_in_order_even
#
# This function sorts the next 2 elements into the array for the merge sort.
#
# @writes storage tmp.bingo:chest_generation categories
# @within
# 	function bingo:lobby/chest_generation/sort_items/sort_by_weight_even
# 	function bingo:lobby/chest_generation/sort_items/write_in_order_even

#>
# @private
#declare score_holder $chest_generation/sort.a

#>
# @private
#declare score_holder $chest_generation/sort.b

execute store result score $chest_generation/sort.a bingo.tmp run data get storage tmp.bingo:chest_generation category.items[-1].weight
execute store result score $chest_generation/sort.b bingo.tmp run data get storage tmp.bingo:chest_generation category.items[-2].weight

data modify storage tmp.bingo:chest_generation mergeSort.even append value []

execute if score $chest_generation/sort.a bingo.tmp > $chest_generation/sort.b bingo.tmp run data modify storage tmp.bingo:chest_generation mergeSort.even[-1] append from storage tmp.bingo:chest_generation category.items[-1]
data modify storage tmp.bingo:chest_generation mergeSort.even[-1] append from storage tmp.bingo:chest_generation category.items[-2]
execute if score $chest_generation/sort.a bingo.tmp <= $chest_generation/sort.b bingo.tmp run data modify storage tmp.bingo:chest_generation mergeSort.even[-1] append from storage tmp.bingo:chest_generation category.items[-1]

data remove storage tmp.bingo:chest_generation category.items[-1]
data remove storage tmp.bingo:chest_generation category.items[-1]

execute if data storage tmp.bingo:chest_generation category.items[1] run function bingo:lobby/chest_generation/sort_items/write_in_order_even