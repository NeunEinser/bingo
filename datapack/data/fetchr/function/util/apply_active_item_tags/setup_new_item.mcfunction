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

execute \
	store result score $apply_tags/add_new.cur_nom fetchr.tmp \
	run data get storage fetchr:items active_items[-1].weight
scoreboard players operation $apply_tags/add_new.cur_nom fetchr.tmp *= $apply_active_item_tags/add_categories_and_items.category_weight fetchr.tmp

execute \
	store result storage fetchr:items active_items[-1].weight_nom int 1 \
	run scoreboard players get $apply_tags/add_new.cur_nom fetchr.tmp