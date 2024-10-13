#> fetchr:init/items/second_pass
#
# Initializes and normalizes items and item categories. Calculates total item
# weight for each category.
#
# @within
# 	function fetchr:init/items/lobby_loaded
# 	function fetchr:init/items/second_pass
# @writes storage fetchr:items categories

data \
	modify storage tmp.fetchr:init initialized_items[-1].item.components.minecraft:lore \
	append value '{"translate": "fetchr.categories.header", "color": "gray", "italic": false}'

data modify storage tmp.fetchr:init item_categories set from storage tmp.fetchr:init initialized_items[-1].categories
data remove storage tmp.fetchr:init initialized_items[-1].categories
execute in fetchr:lobby run function fetchr:init/items/add_category_info with storage tmp.fetchr:init item_categories[-1]

data modify storage tmp.fetchr:init item_categories set from storage tmp.fetchr:init initialized_items[-1].categories
function fetchr:init/items/add_to_category with storage tmp.fetchr:init item_categories[-1]

data modify storage fetchr:items items append from storage tmp.fetchr:init initialized_items[-1]
data remove storage tmp.fetchr:init initialized_items[-1]

execute if data storage tmp.fetchr:init initialized_items[0] run function fetchr:init/items/second_pass
