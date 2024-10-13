#> fetchr:util/apply_active_item_tags/find_next_category
#
# Finds the next category
#
# @within
# 	fetchr:util/apply_active_item_tags
# 	fetchr:util/apply_active_item_tags/add_categories_and_items
# 	fetchr:util/apply_active_item_tags/find_next_category
# @writes storage tmp.fetchr:apply_active_item_tags categories

execute \
	store result score $apply_tags.total_tag_count fetchr.tmp \
	run data get storage tmp.fetchr:apply_active_item_tags categories[-1].tags

data modify entity @s Tags append from storage fetchr:items active_tags[]
data modify entity @s Tags append from storage tmp.fetchr:apply_active_item_tags categories[-1].tags[]

scoreboard players operation $apply_tags.total_tag_count fetchr.tmp += $apply_tags.tag_count fetchr.tmp
execute \
	store result score $apply_tags.total_unique_tags fetchr.tmp \
	run data get entity @s Tags

data modify entity @s Tags set value ["fetchr.string_tester"]

# Always skip empty category 
execute \
	unless data storage tmp.fetchr:apply_active_item_tags categories[-1].items[0] \
	run scoreboard players operation $apply_tags.total_tag_count fetchr.tmp = $apply_tags.total_unique_tags fetchr.tmp

execute \
	if score $apply_tags.total_unique_tags fetchr.tmp = $apply_tags.total_tag_count fetchr.tmp \
	run data remove storage tmp.fetchr:apply_active_item_tags categories[-1]
execute \
	if score $apply_tags.total_unique_tags fetchr.tmp = $apply_tags.total_tag_count fetchr.tmp \
	if data storage tmp.fetchr:apply_active_item_tags categories[0] \
	run function fetchr:util/apply_active_item_tags/find_next_category