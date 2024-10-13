#> fetchr:init/items/update_category_total_weight
#
# Adds the current item's weight to all its category's total item weights
#
# @params ::fetchr::item::ItemCategory
# @within
# 	function fetchr:init/items/first_pass
# 	function fetchr:init/items/update_category_total_weight

#>
# @private
#declare score_holder $init/items/category.total_weight
$execute \
	store result score $init/items/category.total_weight fetchr.tmp \
	run data get storage fetchr:items categories[{id: "$(id)"}].total_item_weight
#>
# @private
#declare score_holder $init/items/category.item_weight
execute \
	store result score $init/items/category.item_weight fetchr.tmp \
	run data get storage tmp.fetchr:init item_categories[-1].weight
scoreboard players operation $init/items/category.total_weight fetchr.tmp += $init/items/category.item_weight fetchr.tmp

$execute \
	store result storage fetchr:items categories[{id: "$(id)"}].total_item_weight int 1 \
	run scoreboard players get $init/items/category.total_weight fetchr.tmp

data remove storage tmp.fetchr:init item_categories[-1]

execute \
	if data storage tmp.fetchr:init item_categories[0] \
	run function fetchr:init/items/update_category_total_weight with storage tmp.fetchr:init item_categories[-1]