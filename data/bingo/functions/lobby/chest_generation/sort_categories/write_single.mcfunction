#> bingo:lobby/chest_generation/sort_categories/write_single
#
# This function adds the last category in case of an odd number of categories
#
# @within
# 	function bingo:lobby/chest_generation/sort_categories/sort_by_length_odd
# 	function bingo:lobby/chest_generation/sort_categories/sort_by_length_even

data modify storage temp:bingo.chest_generation mergeSort.in append value []
data modify storage temp:bingo.chest_generation mergeSort.in[-1] append from storage temp:bingo.chest_generation categories[-1]
data remove storage temp:bingo.chest_generation categories[-1]