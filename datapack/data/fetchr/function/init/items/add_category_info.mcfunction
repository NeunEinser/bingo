#> fetchr:init/items/add_category_info
#
# Adds the category name to the item's lore and adds full information to item
# categories
#
# @input storage tmp.fetchr:init item_categories
# @params ::fetchr::item::ItemCategory
# @writes storage tmp.fetchr:init items[-1].item.components.minecraft:lore
# @params 
# @within
# 	function fetchr:init/items/second_pass
# 	function fetchr:init/items/add_category_info

$execute \
	unless data storage fetchr:items categories[{id: "$(id)"}] \
	run tellraw @a [\
		{"text": "[", "color": "red"},\
		{"translate": "fetchr.logging.error"},\
		"] ",\
		{\
			"translate": "fetchr.setup.error.unknown_category",\
			"with": [\
				{"storage": "tmp.fetchr:init", "nbt": "items[-1].id"},\
				{"storage": "tmp.fetchr:init", "nbt": "category"}\
			]\
		}\
	]

$data \
	modify storage tmp.fetchr:init item_categories[-1] \
	merge from storage fetchr:items categories[{id: "$(id)"}]
data remove storage tmp.fetchr:init item_categories[-1].items

data \
	modify storage tmp.fetchr:init initialized_items[-1].categories \
	append from storage tmp.fetchr:init item_categories[-1]

# loop
data remove storage tmp.fetchr:init item_categories[-1]
execute \
	if data storage tmp.fetchr:init item_categories[0] \
	run function fetchr:init/items/add_category_info with storage tmp.fetchr:init item_categories[-1]
