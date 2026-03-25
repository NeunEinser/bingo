#> fetchr:util/apply_active_item_tags/find_next_category
#
# Finds the next category
#
# @within
# 	fetchr:util/apply_active_item_tags
# 	fetchr:util/apply_active_item_tags/add_categories_and_items
# 	fetchr:util/apply_active_item_tags/find_next_category
# @writes storage tmp.fetchr:apply_active_item_tags categories

data \
	modify storage tmp.fetchr:apply_active_item_tags current_requirement_stack \
	set value []

data \
	modify storage tmp.fetchr:apply_active_item_tags current_requirement_stack \
	append from storage tmp.fetchr:apply_active_item_tags categories[-1].requirements

scoreboard players set $apply_tags.success fetchr.tmp 0

execute \
	unless data storage tmp.fetchr:apply_active_item_tags categories[-1].requirements \
	run scoreboard players set $apply_tags.success fetchr.tmp 1
execute \
	if score $apply_tags.success fetchr.tmp matches 0 \
	if function fetchr:util/apply_active_item_tags/test_requirement \
	run scoreboard players set $apply_tags.success fetchr.tmp 1

data modify entity @s Tags set value ["fetchr.string_tester"]

# Always skip empty category 
execute \
	unless data storage tmp.fetchr:apply_active_item_tags categories[-1].items[0] \
	run scoreboard players set $apply_tags.success fetchr.tmp 0

execute \
	if score $apply_tags.success fetchr.tmp matches 0 \
	run data remove storage tmp.fetchr:apply_active_item_tags categories[-1]
execute \
	if score $apply_tags.success fetchr.tmp matches 0 \
	if data storage tmp.fetchr:apply_active_item_tags categories[0] \
	run function fetchr:util/apply_active_item_tags/find_next_category