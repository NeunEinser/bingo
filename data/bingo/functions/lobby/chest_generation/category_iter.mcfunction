#> bingo:lobby/chest_generation/category_iter
#
# One iteration for a category
#
# @within
# 	function bingo:lobby/chest_generation/generate_item_chests
# 	function bingo:lobby/chest_generation/category_iter

#>
# @within function bingo:lobby/chest_generation/*
#declare score_holder $chest_generation.row
scoreboard players set $chest_generation.row bingo.tmp 0

function bingo:lobby/chest_generation/increment_column

data modify storage temp:bingo.chest_generation category set from storage temp:bingo.chest_generation categories[-1]
data remove storage temp:bingo.chest_generation categories[-1]

scoreboard players set $chest_generation/sort/card.out bingo.tmp 0
execute store result score $chest_generation/sort/card.size bingo.tmp run data get storage temp:bingo.chest_generation category.items
function bingo:lobby/chest_generation/sort_items/determain_cardinality
scoreboard players operation $chest_generation/sort/card.out bingo.tmp %= 2 bingo.const

data remove storage temp:bingo.chest_generation mergeSort.even
data remove storage temp:bingo.chest_generation mergeSort.odd
execute if score $chest_generation/sort/card.out bingo.tmp matches 0 run function bingo:lobby/chest_generation/sort_items/sort_by_weight_even
execute if score $chest_generation/sort/card.out bingo.tmp matches 1 run function bingo:lobby/chest_generation/sort_items/sort_by_weight_odd

data modify storage temp:bingo.chest_generation items set from storage temp:bingo.chest_generation mergeSort.odd[0]

function bingo:lobby/chest_generation/items_iter

execute if data storage temp:bingo.chest_generation categories[-1] run function bingo:lobby/chest_generation/category_iter