#> fetchr:util/apply_active_item_tags
#
# Call this function to apply changes to the active_tags array of storage
# fetchr:items 
#
# @api
# @reads storage fetchr:items active_tags
# @writes storage fetchr:items active_categories
# @writes storage fetchr:items active_items

#>
# @within
# 	function fetchr:util/apply_active_item_tags
# 	function fetchr:util/apply_active_item_tags/**
#declare storage tmp.fetchr:apply_active_item_tags

scoreboard players set $available_category_weight fetchr.state 1
execute \
	store result score $apply_tags.tag_count fetchr.tmp \
	run data get storage fetchr:items active_tags
scoreboard players add $apply_tags.tag_count fetchr.tmp 1

data modify storage fetchr:items active_items set value []
data modify storage fetchr:items active_categories set value []

data modify storage tmp.fetchr:apply_active_item_tags categories set from storage fetchr:items categories
execute \
	in fetchr:lobby positioned 0 0 0 \
	as @e[type=minecraft:marker, tag=fetchr.string_tester, distance=..0.1, limit=1] \
	run function fetchr:util/apply_active_item_tags/find_next_category
execute \
	in fetchr:lobby positioned 0 0 0 \
	as @e[type=minecraft:marker, tag=fetchr.string_tester, distance=..0.1, limit=1] \
	run function fetchr:util/apply_active_item_tags/add_categories_and_items

data modify storage tmp.fetchr:apply_active_item_tags items_with_multiple_categories set value []
data modify storage tmp.fetchr:apply_active_item_tags items_with_multiple_categories \
	append from storage fetchr:items active_items[{multiple_categories: true}]
data remove storage fetchr:items active_items[{multiple_categories: true}]
execute \
	if data storage tmp.fetchr:apply_active_item_tags items_with_multiple_categories[0] \
	run function fetchr:util/apply_active_item_tags/prepare_items_with_multiple_categories

scoreboard players set $total_item_weight fetchr.state 0
scoreboard players set $apply_tags.i fetchr.tmp 0
data modify storage tmp.fetchr:apply_active_item_tags iterate.i set value 0
execute in fetchr:lobby run \
	function fetchr:util/apply_active_item_tags/calculate_global_weight \
	with storage tmp.fetchr:apply_active_item_tags iterate

data modify storage tmp.fetchr:apply_active_item_tags categories_iter \
	set from storage fetchr:items active_categories
scoreboard players set $apply_tags.i fetchr.tmp -1
data modify storage tmp.fetchr:apply_active_item_tags categories_iter[-1].i set value -1
execute in fetchr:lobby run \
	function fetchr:util/apply_active_item_tags/add_category_items \
		with storage tmp.fetchr:apply_active_item_tags categories_iter[-1]

execute in fetchr:lobby run function fetchr:lobby/chest_generation/generate_item_chests