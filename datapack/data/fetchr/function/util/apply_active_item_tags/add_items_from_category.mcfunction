#> fetchr:util/apply_active_item_tags/add_items_from_category
#
# Adds all items of the current category to active_items
#
# @within
# 	fetchr:util/apply_active_item_tags/add_categories_and_items
# 	fetchr:util/apply_active_item_tags/add_items_from_category
# @writes storage tmp.fetchr:apply_active_item_tags active_items

#>
# @within
# 	function fetchr:util/apply_active_item_tags/add_items_from_category
# 	function fetchr:util/apply_active_item_tags/find_already_added_item
#declare score_holder $apply_tags.item_exists
scoreboard players set $apply_tags.item_exists fetchr.tmp 0

execute \
	if data storage tmp.fetchr:apply_active_item_tags categories[-1].items[-1].categories[1] \
	run function fetchr:util/apply_active_item_tags/find_already_added_item \
		with storage tmp.fetchr:apply_active_item_tags categories[-1].items[-1]

execute \
	unless score $apply_tags.item_exists fetchr.tmp matches 1 \
	run function fetchr:util/apply_active_item_tags/setup_new_item

execute \
	if score $apply_tags.item_exists fetchr.tmp matches 1 \
	run function fetchr:util/apply_active_item_tags/modify_existing_item

$data modify storage fetchr:items active_items[-1].active_categories \
	append from storage fetchr:items active_items[-1].categories[{id: "$(id)"}]

# set lore
data \
	modify block 7 0 7 front_text.messages[0] \
	set value '[\
		{"text": "  • ", "color": "gray", "italic": false},\
		{"storage": "fetchr:items", "nbt": "active_items[-1].active_categories[-1].name", "interpret": true},\
		" (",\
		{"storage": "fetchr:items", "nbt": "active_items[-1].active_categories[-1].weight"},\
		"/",\
		{"storage": "fetchr:items", "nbt": "active_items[-1].active_categories[-1].total_item_weight"},\
		")"\
	]'
data modify storage fetchr:items active_items[-1].item.components.minecraft:lore \
	append from block 7 0 7 front_text.messages[0]

data remove storage tmp.fetchr:apply_active_item_tags categories[-1].items[-1]
execute \
	if data storage tmp.fetchr:apply_active_item_tags categories[-1].items[0] \
	run function fetchr:util/apply_active_item_tags/add_items_from_category \
		with storage tmp.fetchr:apply_active_item_tags categories[-1]