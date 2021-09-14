#> bingo:lobby/chest_generation/sort_items/write_single_odd
#
# This function adds the last item in case of an odd number of items
#
# @within bingo:lobby/chest_generation/sort_items/sort_by_weight_odd

data modify storage tmp.bingo:chest_generation mergeSort.odd append value []
data modify storage tmp.bingo:chest_generation mergeSort.odd[-1] append from storage tmp.bingo:chest_generation category.items[-1]
data remove storage tmp.bingo:chest_generation category.items[-1]