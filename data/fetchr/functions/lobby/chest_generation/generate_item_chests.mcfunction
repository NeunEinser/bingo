#> fetchr:lobby/chest_generation/generate_item_chests
#
# This function generates the item display chests in the lobby
#
# @internal

#>
# @within function fetchr:lobby/chest_generation/**
#declare storage tmp.fetchr:chest_generation

#>
# @within function fetchr:lobby/chest_generation/*
#declare tag fetchr.item_chest_marker

#>
# @private
#declare tag fetchr.chest_generation_marker

#>
# @within function fetchr:lobby/chest_generation/*
#declare score_holder $chest_generation.column
scoreboard players set $chest_generation.column fetchr.tmp -1

data modify storage tmp.fetchr:chest_generation categories set from storage fetchr:items activeCategories

scoreboard players set $chest_generation/sort/card.out fetchr.tmp 0
execute store result score $chest_generation/sort/card.size fetchr.tmp run data get storage fetchr:items activeCategories
function fetchr:lobby/chest_generation/sort_categories/determain_cardinality
scoreboard players operation $chest_generation/sort/card.out fetchr.tmp %= 2 fetchr.const

data remove storage tmp.fetchr:chest_generation mergeSort.even
data remove storage tmp.fetchr:chest_generation mergeSort.odd
execute if score $chest_generation/sort/card.out fetchr.tmp matches 0 run function fetchr:lobby/chest_generation/sort_categories/sort_by_length_even
execute if score $chest_generation/sort/card.out fetchr.tmp matches 1 run function fetchr:lobby/chest_generation/sort_categories/sort_by_length_odd
data modify storage tmp.fetchr:chest_generation categories set from storage tmp.fetchr:chest_generation mergeSort.odd[0]

execute at @e[type=minecraft:area_effect_cloud, tag=fetchr.chest_generation_marker, limit=1] run function fetchr:lobby/chest_generation/initialize_chests