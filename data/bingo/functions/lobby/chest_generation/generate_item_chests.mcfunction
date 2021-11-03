#> bingo:lobby/chest_generation/generate_item_chests
#
# This function generates the item display chests in the lobby
#
# @internal

#>
# @within function bingo:lobby/chest_generation/**
#declare storage tmp.bingo:chest_generation

#>
# @within function bingo:lobby/chest_generation/*
#declare tag bingo.item_chest_marker

#>
# @private
#declare tag bingo.chest_generation_marker

#>
# @within function bingo:lobby/chest_generation/*
#declare score_holder $chest_generation.column
scoreboard players set $chest_generation.column bingo.tmp -1

data modify storage tmp.bingo:chest_generation categories set from storage bingo:items categories

scoreboard players set $chest_generation/sort/card.out bingo.tmp 0
execute store result score $chest_generation/sort/card.size bingo.tmp run data get storage bingo:items categories
function bingo:lobby/chest_generation/sort_categories/determain_cardinality
scoreboard players operation $chest_generation/sort/card.out bingo.tmp %= 2 bingo.const

data remove storage tmp.bingo:chest_generation mergeSort.even
data remove storage tmp.bingo:chest_generation mergeSort.odd
execute if score $chest_generation/sort/card.out bingo.tmp matches 0 run function bingo:lobby/chest_generation/sort_categories/sort_by_length_even
execute if score $chest_generation/sort/card.out bingo.tmp matches 1 run function bingo:lobby/chest_generation/sort_categories/sort_by_length_odd
data modify storage tmp.bingo:chest_generation categories set from storage tmp.bingo:chest_generation mergeSort.odd[0]

execute at @e[type=minecraft:area_effect_cloud, tag=bingo.chest_generation_marker, limit=1] run function bingo:lobby/chest_generation/initialize_chests