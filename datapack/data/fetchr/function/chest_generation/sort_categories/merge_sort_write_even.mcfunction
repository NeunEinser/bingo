#> fetchr:lobby/chest_generation/sort_categories/merge_sort_write_even
#
# This function sorts the next 2 lists into the current output list
#
# @writes storage tmp.fetchr:chest_generation categories
# @within
# 	function fetchr:lobby/chest_generation/sort_categories/merge_sort_even
# 	function fetchr:lobby/chest_generation/sort_categories/merge_sort_write_even

#>
# @private
#declare score_holder $chest_generation/sort.a

#>
# @private
#declare score_holder $chest_generation/sort.b

execute store result score $chest_generation/sort.a fetchr.tmp run data get storage tmp.fetchr:chest_generation mergeSort.odd[-1][-1].items
execute store result score $chest_generation/sort.b fetchr.tmp run data get storage tmp.fetchr:chest_generation mergeSort.odd[-2][-1].items

execute if score $chest_generation/sort.a fetchr.tmp > $chest_generation/sort.b fetchr.tmp run data modify storage tmp.fetchr:chest_generation mergeSort.even[-1] append from storage tmp.fetchr:chest_generation mergeSort.odd[-1][-1]
execute if score $chest_generation/sort.a fetchr.tmp > $chest_generation/sort.b fetchr.tmp run data remove storage tmp.fetchr:chest_generation mergeSort.odd[-1][-1]

execute if score $chest_generation/sort.a fetchr.tmp <= $chest_generation/sort.b fetchr.tmp run data modify storage tmp.fetchr:chest_generation mergeSort.even[-1] append from storage tmp.fetchr:chest_generation mergeSort.odd[-2][-1]
execute if score $chest_generation/sort.a fetchr.tmp <= $chest_generation/sort.b fetchr.tmp run data remove storage tmp.fetchr:chest_generation mergeSort.odd[-2][-1]

execute if data storage tmp.fetchr:chest_generation mergeSort.odd[-1][0] if data storage tmp.fetchr:chest_generation mergeSort.odd[-2][0] run function fetchr:lobby/chest_generation/sort_categories/merge_sort_write_even