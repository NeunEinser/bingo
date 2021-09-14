#> bingo:lobby/chest_generation/sort_items/sort_by_weight_even
#
# This function sorts the item list by the item weight if the amount of items
# log2 is even.
#
# @within
# 	function bingo:lobby/chest_generation/category_iter
# 	function bingo:lobby/chest_generation/sort_items/sort_by_weight_odd

execute if data storage tmp.bingo:chest_generation category.items[1] run function bingo:lobby/chest_generation/sort_items/write_in_order_even
execute unless data storage tmp.bingo:chest_generation category.items[1] run function bingo:lobby/chest_generation/sort_items/write_single_even

function bingo:lobby/chest_generation/sort_items/merge_sort_odd