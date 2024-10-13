#> fetchr:util/apply_active_item_tags/add_categories_and_items
#
# Iterates over all categories and adds it and its items.
#
# @within
# 	fetchr:util/apply_active_item_tags
# 	fetchr:util/apply_active_item_tags/add_categories_and_items
# @reads storage fetchr:items active_tags
# @writes storage fetchr:items active_categories
# @writes storage tmp.fetchr:apply_active_item_tags active_items

data modify storage fetchr:items active_categories append from storage tmp.fetchr:apply_active_item_tags categories[-1]
data modify storage fetchr:items active_categories[-1].items set value []
function fetchr:util/apply_active_item_tags/add_items_from_category \
	with storage tmp.fetchr:apply_active_item_tags categories[-1]

#>
# @private
#declare score_holder $apply_tags.category_weight
execute \
	store result score $apply_tags.category_weight fetchr.tmp \
	run data get storage tmp.fetchr:apply_active_item_tags categories[-1].total_item_weight

scoreboard players operation $gcd.a 91.math.io = $available_category_weight fetchr.state
scoreboard players operation $gcd.b 91.math.io = $apply_tags.category_weight fetchr.tmp
function neun_einser.math:greatest_common_divisor

scoreboard players operation $apply_tags.category_weight fetchr.tmp /= $gcd.result 91.math.io
scoreboard players operation $available_category_weight fetchr.state *= $apply_tags.category_weight fetchr.tmp

data remove storage tmp.fetchr:apply_active_item_tags categories[-1]
function fetchr:util/apply_active_item_tags/find_next_category

execute \
	if data storage tmp.fetchr:apply_active_item_tags categories[0] \
	run function fetchr:util/apply_active_item_tags/add_categories_and_items