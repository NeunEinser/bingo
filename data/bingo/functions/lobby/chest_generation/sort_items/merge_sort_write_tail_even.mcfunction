#> bingo:lobby/chest_generation/sort_items/merge_sort_write_tail_even
#
# This function sorts the next 2 lists into the current output list
#
# @writes storage tmp.bingo:chest_generation categories
# @within
# 	function bingo:lobby/chest_generation/sort_items/merge_sort_even
# 	function bingo:lobby/chest_generation/sort_items/merge_sort_write_tail_even

data modify storage tmp.bingo:chest_generation mergeSort.even[-1] append from storage tmp.bingo:chest_generation mergeSort.odd[-1][-1]
data remove storage tmp.bingo:chest_generation mergeSort.odd[-1][-1]

execute if data storage tmp.bingo:chest_generation mergeSort.odd[-1][0] run function bingo:lobby/chest_generation/sort_items/merge_sort_write_tail_even