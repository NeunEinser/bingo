#> fetchr:chest_generation/generate_item_chests
#
# This function generates the item display chests in the lobby
#
# @internal

#>
# @within function fetchr:chest_generation/**
#declare storage tmp.fetchr:chest_generation

#>
# @within function fetchr:chest_generation/*
#declare tag fetchr.item_chest_marker

#>
# @within function fetchr:chest_generation/*
#declare score_holder $chest_generation.column
scoreboard players set $chest_generation.column fetchr.tmp 19

execute \
	if predicate fetchr:is_in_game \
	run data modify storage tmp.fetchr:chest_generation categories set from storage fetchr:items active_categories
execute \
	unless predicate fetchr:is_in_game \
	run data modify storage tmp.fetchr:chest_generation categories set from storage fetchr:items categories

scoreboard players set $chest_generation/sort/card.out fetchr.tmp 0
execute \
	if predicate fetchr:is_in_game \
	store result score $chest_generation/sort/card.size fetchr.tmp \
	run data get storage fetchr:items active_categories
execute \
	unless predicate fetchr:is_in_game \
	store result score $chest_generation/sort/card.size fetchr.tmp \
	run data get storage fetchr:items categories
function fetchr:chest_generation/sort_categories/determain_cardinality
scoreboard players operation $chest_generation/sort/card.out fetchr.tmp %= 2 fetchr.const

data remove storage tmp.fetchr:chest_generation mergeSort.even
data remove storage tmp.fetchr:chest_generation mergeSort.odd
execute if score $chest_generation/sort/card.out fetchr.tmp matches 0 run function fetchr:chest_generation/sort_categories/sort_by_length_even
execute if score $chest_generation/sort/card.out fetchr.tmp matches 1 run function fetchr:chest_generation/sort_categories/sort_by_length_odd
data modify storage tmp.fetchr:chest_generation categories set from storage tmp.fetchr:chest_generation mergeSort.odd[0]

function fetchr:chest_generation/initialize_chests