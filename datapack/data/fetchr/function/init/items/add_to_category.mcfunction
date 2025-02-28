#> fetchr:init/items/add_to_category
#
# Sets category-specific attributes.
#
# @params ::fetchr::item::ItemCategory
# @within
# 	function fetchr:init/items/second_pass
# 	function fetchr:init/items/add_to_category

$execute \
	unless data storage fetchr:items categories[{ id: "$(id)" }] \
	run return fail

$data \
	modify storage fetchr:items categories[{ id: "$(id)" }].items \
	append from storage tmp.fetchr:init initialized_items[-1]
$data \
	modify storage fetchr:items categories[{ id: "$(id)" }].items[-1].weight \
	set from storage tmp.fetchr:init item_categories[-1].weight

data remove storage tmp.fetchr:init item_categories[-1]
execute \
	if data storage tmp.fetchr:init item_categories[0] \
	run function fetchr:init/items/add_to_category with storage tmp.fetchr:init item_categories[-1]