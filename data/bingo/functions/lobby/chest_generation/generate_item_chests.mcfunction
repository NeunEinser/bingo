#> bingo:lobby/chest_generation/generate_item_chests
#
# This function generates the item display chrsts in the lobby
#
# @internal

#>
# @within function bingo:lobby/chest_generation/*
#declare storage temp:bingo.chest_generation

#>
# @within function bingo:lobby/chest_generation/*
#declare tag bingo.item_chest_marker

#>
# @within function bingo:lobby/chest_generation/*
#declare score_holder $chest_generation.column
scoreboard players set $chest_generation.column bingo.tmp 0

setblock 0 64 0 minecraft:chest[type=left]
setblock 1 64 0 minecraft:chest[type=right]

summon minecraft:area_effect_cloud 1 64 0 {Tags:["bingo.item_chest_marker"]}

function bingo:lobby/chest_generation/category_iter

data modify storage temp:bingo.chest_generation categories set from storage bingo:items categories

