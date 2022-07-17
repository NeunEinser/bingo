#> fetchr:init/items/update_category_total_weight
#
# Adds the current item's weight to all its category's total item weights
#
# @within
# 	function fetchr:init/items/first_pass
# 	function fetchr:init/items/update_category_total_weight

data modify storage tmp.fetchr:init itemCategories set from storage tmp.fetchr:init items[-1].categories
data modify storage tmp.fetchr:init searchedCategory set from storage tmp.fetchr:init categories[-1].id
function fetchr:init/items/find_item_category

#>
# @private
#declare score_holder $init/items/category.total_weight
execute store result score $init/items/category.total_weight fetchr.tmp run data get storage tmp.fetchr:init categories[-1].totalItemWeight
#>
# @private
#declare score_holder $init/items/category.item_weight
execute store result score $init/items/category.item_weight fetchr.tmp run data get storage tmp.fetchr:init itemCategories[-1].weight
scoreboard players operation $init/items/category.total_weight fetchr.tmp += $init/items/category.item_weight fetchr.tmp

execute store result storage tmp.fetchr:init categories[-1].totalItemWeight int 1 run scoreboard players get $init/items/category.total_weight fetchr.tmp

data modify storage fetchr:items categories append from storage tmp.fetchr:init categories[-1]
data remove storage tmp.fetchr:init categories[-1]

execute if data storage tmp.fetchr:init categories[0] run function fetchr:init/items/update_category_total_weight