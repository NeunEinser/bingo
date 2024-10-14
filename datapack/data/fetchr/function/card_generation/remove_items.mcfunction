#> fetchr:card_generation/remove_items
#
# Removes all items that have the current category
#
# @within
# 	function fetchr:card_generation/cleanup_and_next_slot
# 	function fetchr:card_generation/remove_items
# @writes storage tmp.fetchr:card_generation removed_items
# @params id: #[id] string

$data modify storage tmp.fetchr:card_generation removed_items \
	append from storage tmp.fetchr:card_generation items[{active_categories:[{id: "$(id)"}]}]
$data remove storage tmp.fetchr:card_generation items[{active_categories:[{id: "$(id)"}]}]
$data remove storage tmp.fetchr:card_generation removed_items[].active_categories[{id: "$(id)"}]

data remove storage tmp.fetchr:card_generation item_categories[-1]
execute \
	if data storage tmp.fetchr:card_generation item_categories[0] \
	run function fetchr:card_generation/remove_items \
		with storage tmp.fetchr:card_generation item_categories[-1]