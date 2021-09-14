#> bingo:lobby/chest_generation/sort_categories/write_in_order_even
#
# This function sorts the next 2 elements into the array for the merge sort.
#
# @writes storage tmp.bingo:chest_generation categories
# @within
# 	function bingo:lobby/chest_generation/sort_categories/sort_by_length_even
# 	function bingo:lobby/chest_generation/sort_categories/write_in_order_even

#>
# @private
#declare score_holder $chest_generation/sort.a

#>
# @private
#declare score_holder $chest_generation/sort.b

execute store result score $chest_generation/sort.a bingo.tmp run data get storage tmp.bingo:chest_generation categories[-1].items
execute store result score $chest_generation/sort.b bingo.tmp run data get storage tmp.bingo:chest_generation categories[-2].items

data modify storage tmp.bingo:chest_generation mergeSort.even append value []

execute if score $chest_generation/sort.a bingo.tmp > $chest_generation/sort.b bingo.tmp run data modify storage tmp.bingo:chest_generation mergeSort.even[-1] append from storage tmp.bingo:chest_generation categories[-1]
data modify storage tmp.bingo:chest_generation mergeSort.even[-1] append from storage tmp.bingo:chest_generation categories[-2]
execute if score $chest_generation/sort.a bingo.tmp <= $chest_generation/sort.b bingo.tmp run data modify storage tmp.bingo:chest_generation mergeSort.even[-1] append from storage tmp.bingo:chest_generation categories[-1]

data remove storage tmp.bingo:chest_generation categories[-1]
data remove storage tmp.bingo:chest_generation categories[-1]

execute if data storage tmp.bingo:chest_generation categories[1] run function bingo:lobby/chest_generation/sort_categories/write_in_order_even