#> fetchr:util/apply_active_item_tags/find_already_added_item
#
# Finds an already added version of the current item. This is used to prevent
# dubley adding items that are within multiple categories.
#
# @within fetchr:util/apply_active_item_tags/add_items_from_category
# @params id: #[id] string
# @writes storage fetchr:items active_items

data remove storage tmp.fetchr:apply_active_item_tags item
$execute \
	store success score $apply_tags.item_exists fetchr.tmp \
	run data modify storage tmp.fetchr:apply_active_item_tags item \
		set from storage fetchr:items active_items[{id: "$(id)"}]
$data remove storage fetchr:items active_items[{id: "$(id)"}]
data modify storage fetchr:items active_items \
	append from storage tmp.fetchr:apply_active_item_tags item