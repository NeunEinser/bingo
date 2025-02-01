#> fetchr:util/apply_active_item_tags/add_category_items
#
# Adds active items to active categories
#
# @within
# 	fetchr:util/apply_active_item_tags
# 	fetchr:util/apply_active_item_tags/add_category_items
# @writes storage fetchr:items active_categories
# @params struct { ...::fetchr::item::ActiveCategory, i: int }

data modify storage tmp.fetchr:apply_active_item_tags category_items set value []
$data \
	modify storage tmp.fetchr:apply_active_item_tags category_items \
	append from storage fetchr:items active_items[{ active_categories: [{ id: "$(id)" }]}]

function fetchr:util/apply_active_item_tags/add_category_item \
	with storage tmp.fetchr:apply_active_item_tags categories_iter[-1]

data remove storage tmp.fetchr:apply_active_item_tags categories_iter[-1]
execute \
	store result storage tmp.fetchr:apply_active_item_tags categories_iter[-1].i int 1 \
	run scoreboard players remove $apply_tags.i fetchr.tmp 1

execute \
	if data storage tmp.fetchr:apply_active_item_tags categories_iter[0] \
	run function fetchr:util/apply_active_item_tags/add_category_items \
		with storage tmp.fetchr:apply_active_item_tags categories_iter[-1]