#> fetchr:lobby/chest_generation/sort_categories/merge_sort_write_tail_even
#
# This function sorts the next 2 lists into the current output list
#
# @writes storage tmp.fetchr:chest_generation categories
# @within
# 	function fetchr:lobby/chest_generation/sort_categories/merge_sort_even
# 	function fetchr:lobby/chest_generation/sort_categories/merge_sort_write_tail_even

data modify storage tmp.fetchr:chest_generation mergeSort.even[-1] append from storage tmp.fetchr:chest_generation mergeSort.odd[-1][-1]
data remove storage tmp.fetchr:chest_generation mergeSort.odd[-1][-1]

execute if data storage tmp.fetchr:chest_generation mergeSort.odd[-1][0] run function fetchr:lobby/chest_generation/sort_categories/merge_sort_write_tail_even