#> fetchr:util/apply_active_item_tags/modify_existing_item
#
# Adds all items of the current category to active_items
#
# @within fetchr:util/apply_active_item_tags/add_items_from_category
# @writes storage fetchr:items active_items

#>
# @private
#declare score_holder $apply_tags/mod_existing.result_denom
execute \
	store result score $apply_tags/mod_existing.result_denom fetchr.tmp \
	run data get storage fetchr:items active_items[-1].weight_denom

#>
# @private
#declare score_holder $apply_tags/mod_existing.cur_denom
execute \
	store result score $apply_tags/mod_existing.cur_denom fetchr.tmp run \
	data get storage tmp.fetchr:apply_active_item_tags categories[-1].total_item_weight

#>
# @private
#declare score_holder $apply_tags/mod_existing.result_nom
execute \
	store result score $apply_tags/mod_existing.result_nom fetchr.tmp \
	run data get storage fetchr:items active_items[-1].weight_nom

#>
# @private
#declare score_holder $apply_tags/mod_existing.cur_nom
execute \
	store result score $apply_tags/mod_existing.cur_nom fetchr.tmp \
	run data get storage tmp.fetchr:apply_active_item_tags categories[-1].items[-1].weight

scoreboard players operation $apply_tags/mod_existing.cur_nom fetchr.tmp \
	*= $apply_tags/mod_existing.result_denom fetchr.tmp
execute \
	store result storage fetchr:items active_items[-1].weight_denom int 1 \
	run scoreboard players operation $apply_tags/mod_existing.result_denom fetchr.tmp \
		*= $apply_tags/mod_existing.cur_denom fetchr.tmp

scoreboard players operation $apply_tags/mod_existing.result_nom fetchr.tmp \
	*= $apply_tags/mod_existing.cur_denom fetchr.tmp

execute \
	store result storage fetchr:items active_items[-1].weight_nom int 1 \
	run scoreboard players operation $apply_tags/mod_existing.result_nom fetchr.tmp \
		+= $apply_tags/mod_existing.cur_nom fetchr.tmp

data modify storage fetchr:items active_items[-1].multiple_categories set value true

