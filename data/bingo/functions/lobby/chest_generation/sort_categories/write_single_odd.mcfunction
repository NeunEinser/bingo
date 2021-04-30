#> bingo:lobby/chest_generation/sort_categories/write_single_odd
#
# This function adds the last category in case of an odd number of categories
#
# @within function bingo:lobby/chest_generation/sort_categories/sort_by_length_odd

data modify storage temp:bingo.chest_generation mergeSort.odd append value []
data modify storage temp:bingo.chest_generation mergeSort.odd[-1] append from storage temp:bingo.chest_generation categories[-1]
data remove storage temp:bingo.chest_generation categories[-1]