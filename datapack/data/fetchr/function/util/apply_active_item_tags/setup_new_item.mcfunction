#> fetchr:util/apply_active_item_tags/modify_existing_item
#
# Sets up a newly added item
#
# @within fetchr:util/apply_active_item_tags/add_items_from_category
# @writes storage fetchr:items active_items

data \
	modify storage fetchr:items active_items \
	append from storage tmp.fetchr:apply_active_item_tags categories[-1].items[-1]
data modify storage fetchr:items active_items[-1].active_categories set value []
data \
	modify storage fetchr:items active_items[-1].weight_denom \
	set from storage tmp.fetchr:apply_active_item_tags categories[-1].total_item_weight
data \
	modify storage fetchr:items active_items[-1].weight_nom \
	set from storage fetchr:items active_items[-1].weight