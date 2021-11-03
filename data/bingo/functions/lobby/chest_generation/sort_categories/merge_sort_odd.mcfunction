#> bingo:lobby/chest_generation/sort_categories/merge_sort_odd
#
# This function sorts the entire input using a merge sort algorithm if the
# remaining amount of iterations is even
#
# @within
# 	function bingo:lobby/chest_generation/sort_categories/sort_by_length_even
# 	function bingo:lobby/chest_generation/sort_categories/merge_sort_odd
# 	function bingo:lobby/chest_generation/sort_categories/merge_sort_even
# @reads storage tmp.bingo:chest_generation mergeSort.odd
# @writes storage tmp.bingo:chest_generation mergeSort.even

data modify storage tmp.bingo:chest_generation mergeSort.odd append value []
function bingo:lobby/chest_generation/sort_categories/merge_sort_write_odd

execute unless data storage tmp.bingo:chest_generation mergeSort.even[-1][0] run data remove storage tmp.bingo:chest_generation mergeSort.even[-1]
function bingo:lobby/chest_generation/sort_categories/merge_sort_write_tail_odd

data remove storage tmp.bingo:chest_generation mergeSort.even[-1]
execute unless data storage tmp.bingo:chest_generation mergeSort.even[-1][0] run data remove storage tmp.bingo:chest_generation mergeSort.even[-1]

execute unless data storage tmp.bingo:chest_generation mergeSort.even[0] if data storage tmp.bingo:chest_generation mergeSort.odd[1] run function bingo:lobby/chest_generation/sort_categories/merge_sort_even
execute if data storage tmp.bingo:chest_generation mergeSort.even[0] if data storage tmp.bingo:chest_generation mergeSort.odd[0] run function bingo:lobby/chest_generation/sort_categories/merge_sort_odd