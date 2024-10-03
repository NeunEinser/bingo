#> fetchr:lobby/chest_generation/sort_items/merge_sort_odd
#
# This function sorts the entire input using a merge sort algorithm if the
# remaining amount of iterations is even
#
# @within
# 	function fetchr:lobby/chest_generation/sort_items/sort_by_weight_even
# 	function fetchr:lobby/chest_generation/sort_items/merge_sort_odd
# 	function fetchr:lobby/chest_generation/sort_items/merge_sort_even
# @reads storage tmp.fetchr:chest_generation mergeSort.odd
# @writes storage tmp.fetchr:chest_generation mergeSort.even

data modify storage tmp.fetchr:chest_generation mergeSort.odd append value []
function fetchr:lobby/chest_generation/sort_items/merge_sort_write_odd

execute unless data storage tmp.fetchr:chest_generation mergeSort.even[-1][0] run data remove storage tmp.fetchr:chest_generation mergeSort.even[-1]
function fetchr:lobby/chest_generation/sort_items/merge_sort_write_tail_odd

data remove storage tmp.fetchr:chest_generation mergeSort.even[-1]
execute unless data storage tmp.fetchr:chest_generation mergeSort.even[-1][0] run data remove storage tmp.fetchr:chest_generation mergeSort.even[-1]

execute unless data storage tmp.fetchr:chest_generation mergeSort.even[0] if data storage tmp.fetchr:chest_generation mergeSort.odd[1] run function fetchr:lobby/chest_generation/sort_items/merge_sort_even
execute if data storage tmp.fetchr:chest_generation mergeSort.even[0] if data storage tmp.fetchr:chest_generation mergeSort.odd[0] run function fetchr:lobby/chest_generation/sort_items/merge_sort_odd