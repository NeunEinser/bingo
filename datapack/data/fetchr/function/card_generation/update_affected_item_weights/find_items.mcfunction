#> fetchr:card_generation/update_affected_item_weights/find_items
#
# Finds all items that need recalcualtion
#
# @params ::fetchr::item::ActiveItemCategory
# @within
# 	function fetchr:card_generation/update_affected_item_weights/exec
# 	function fetchr:card_generation/update_affected_item_weights/iter

$data \
	modify storage tmp.fetchr:card_generation category_items \
	append from storage tmp.fetchr:card_generation items[{ active_categories: [{ id: "$(id)" }]}]
$data remove storage tmp.fetchr:card_generation items[{ active_categories: [{ id: "$(id)" }]}]

data remove storage tmp.fetchr:card_generation categories_with_removed_item[-1].weight
$data \
	modify storage tmp.fetchr:card_generation category_items[].active_categories[{ id: "$(id)" }] \
	merge from storage tmp.fetchr:card_generation categories_with_removed_item[-1]

data remove storage tmp.fetchr:card_generation categories_with_removed_item[-1]

execute \
	if data storage tmp.fetchr:card_generation categories_with_removed_item[0] \
	run function fetchr:card_generation/update_affected_item_weights/find_items