#> fetchr:util/apply_active_item_tags/add_category_item
#
# Adds the current item to the active category
#
# @within
# 	fetchr:util/apply_active_item_tags
# 	fetchr:util/apply_active_item_tags/add_category_items
# @writes storage fetchr:items active_categories
# @params
# 	i: int
# 	id: #[id] string

data modify storage tmp.fetchr:apply_active_item_tags category_items[-1].item.components.minecraft:lore append value '""'
data \
	modify block 7 0 7 front_text.messages[0] \
	set value '[\
		{"translate": "fetchr.item.global_weight", "color": "gray", "italic": false},\
		": ",\
		{"storage": "tmp.fetchr:apply_active_item_tags", "nbt": "category_items[-1].weight"}\
	]'

data modify storage tmp.fetchr:apply_active_item_tags category_items[-1].item.components.minecraft:lore \
	append from block 7 0 7 front_text.messages[0]


data modify storage tmp.fetchr:apply_active_item_tags category_items[-1].global_weight \
	set from storage tmp.fetchr:apply_active_item_tags category_items[-1].weight

$data modify storage tmp.fetchr:apply_active_item_tags category_items[-1].weight \
	set from storage tmp.fetchr:apply_active_item_tags category_items[-1].active_categories[{id: "$(id)"}].weight

$data modify storage fetchr:items active_categories[$(i)].items \
	append from storage tmp.fetchr:apply_active_item_tags category_items[-1]
data remove storage tmp.fetchr:apply_active_item_tags category_items[-1]

execute \
	if data storage tmp.fetchr:apply_active_item_tags category_items[0] \
	run function fetchr:util/apply_active_item_tags/add_category_item \
		with storage tmp.fetchr:apply_active_item_tags categories_iter[-1]