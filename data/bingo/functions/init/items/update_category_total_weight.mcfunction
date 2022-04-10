#> bingo:init/items/update_category_total_weight
#
# Adds the current item's weight to all its category's total item weights
#
# @within
# 	function bingo:init/items/first_pass
# 	function bingo:init/items/update_category_total_weight

data modify storage tmp.bingo:init itemCategories set from storage tmp.bingo:init items[-1].categories
data modify storage tmp.bingo:init searchedCategory set from storage tmp.bingo:init categories[-1].id
function bingo:init/items/find_item_category

#>
# @private
#declare score_holder $init/items/category.total_weight
execute store result score $init/items/category.total_weight bingo.tmp run data get storage tmp.bingo:init categories[-1].totalItemWeight
#>
# @private
#declare score_holder $init/items/category.item_weight
execute store result score $init/items/category.item_weight bingo.tmp run data get storage tmp.bingo:init itemCategories[-1].weight
scoreboard players operation $init/items/category.total_weight bingo.tmp += $init/items/category.item_weight bingo.tmp

execute store result storage tmp.bingo:init categories[-1].totalItemWeight int 1 run scoreboard players get $init/items/category.total_weight bingo.tmp

data modify storage bingo:items categories append from storage tmp.bingo:init categories[-1]
data remove storage tmp.bingo:init categories[-1]

execute if data storage tmp.bingo:init categories[0] run function bingo:init/items/update_category_total_weight