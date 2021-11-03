#> bingo:lobby/chest_generation/sort_items/write_single_even
#
# This function adds the last item in case of an odd number of items
#
# @within bingo:lobby/chest_generation/sort_items/sort_by_weight_even

data modify storage tmp.bingo:chest_generation mergeSort.even append value []
data modify storage tmp.bingo:chest_generation mergeSort.even[-1] append from storage tmp.bingo:chest_generation category.items[-1]
data remove storage tmp.bingo:chest_generation category.items[-1]