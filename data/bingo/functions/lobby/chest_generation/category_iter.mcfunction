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

function bingo:lobby/chest_generation/items_iter

execute if data storage temp:bingo.chest_generation categories[-1] run function bingo:lobby/chest_generation/category_iter