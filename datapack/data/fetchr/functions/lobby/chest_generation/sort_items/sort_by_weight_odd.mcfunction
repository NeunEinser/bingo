#> fetchr:lobby/chest_generation/sort_items/sort_by_weight_odd
#
# This function sorts the item list by the item weight if the amount of items
# log2 is odd.
#
# @within
# 	function fetchr:lobby/chest_generation/category_iter
# 	function fetchr:lobby/chest_generation/sort_items/sort_by_weight_even

execute if data storage tmp.fetchr:chest_generation category.items[1] run function fetchr:lobby/chest_generation/sort_items/write_in_order_odd
execute unless data storage tmp.fetchr:chest_generation category.items[1] run function fetchr:lobby/chest_generation/sort_items/write_single_odd

function fetchr:lobby/chest_generation/sort_items/merge_sort_even