#> fetchr:lobby/chest_generation/category_iter
#
# One iteration for a category
#
# @within
# 	function fetchr:lobby/chest_generation/initialize_chests
# 	function fetchr:lobby/chest_generation/category_iter

#>
# @within function fetchr:lobby/chest_generation/*
#declare score_holder $chest_generation.row
scoreboard players set $chest_generation.row fetchr.tmp 0

function fetchr:lobby/chest_generation/increment_column

data modify storage tmp.fetchr:chest_generation category set from storage tmp.fetchr:chest_generation categories[-1]
data remove storage tmp.fetchr:chest_generation categories[-1]

execute \
	store result score $chest_generation.size fetchr.tmp \
	run data get storage tmp.fetchr:chest_generation category.items
scoreboard players set $chest_generation/sort/card.out fetchr.tmp 0
scoreboard players operation $chest_generation/sort/card.size fetchr.tmp = $chest_generation.size fetchr.tmp
function fetchr:lobby/chest_generation/sort_items/determain_cardinality
scoreboard players operation $chest_generation/sort/card.out fetchr.tmp %= 2 fetchr.const

data remove storage tmp.fetchr:chest_generation mergeSort.even
data remove storage tmp.fetchr:chest_generation mergeSort.odd
execute if score $chest_generation/sort/card.out fetchr.tmp matches 0 run function fetchr:lobby/chest_generation/sort_items/sort_by_weight_even
execute if score $chest_generation/sort/card.out fetchr.tmp matches 1 run function fetchr:lobby/chest_generation/sort_items/sort_by_weight_odd

data modify storage tmp.fetchr:chest_generation items set from storage tmp.fetchr:chest_generation mergeSort.odd[0]

scoreboard players operation $chest_generation.overflow_col_count fetchr.tmp = $chest_generation.size fetchr.tmp
scoreboard players remove $chest_generation.overflow_col_count fetchr.tmp 2
execute \
	if score $chest_generation.overflow_col_count fetchr.tmp matches ..-1 \
	run scoreboard players set $chest_generation.overflow_col_count fetchr.tmp 0
execute \
	if block ~ ~ ~ minecraft:chest[type=single] \
	run scoreboard players operation $chest_generation.overflow_col_count fetchr.tmp /= 2 fetchr.const
execute \
	unless block ~ ~ ~ minecraft:chest[type=single] \
	run scoreboard players operation $chest_generation.overflow_col_count fetchr.tmp /= 5 fetchr.const

scoreboard players set $chest_generation.remaining_cols fetchr.tmp 8
execute \
	if block ~ ~ ~ minecraft:chest[type=single] \
	run scoreboard players set $chest_generation.remaining_cols fetchr.tmp 17
scoreboard players operation $chest_generation.remaining_cols fetchr.tmp -= $chest_generation.column fetchr.tmp

execute \
	if score $chest_generation.remaining_cols fetchr.tmp < $chest_generation.overflow_col_count fetchr.tmp \
	run function fetchr:lobby/chest_generation/next_chest

function fetchr:lobby/chest_generation/items_iter

execute if data storage tmp.fetchr:chest_generation categories[-1] run function fetchr:lobby/chest_generation/category_iter