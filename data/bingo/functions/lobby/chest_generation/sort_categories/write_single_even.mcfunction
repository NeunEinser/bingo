#> bingo:lobby/chest_generation/sort_categories/write_single_even
#
# This function adds the last category in case of an odd number of categories
#
# @within function bingo:lobby/chest_generation/sort_categories/sort_by_length_even

data modify storage tmp.bingo:chest_generation mergeSort.even append value []
data modify storage tmp.bingo:chest_generation mergeSort.even[-1] append from storage tmp.bingo:chest_generation categories[-1]
data remove storage tmp.bingo:chest_generation categories[-1]