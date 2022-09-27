#> fetchr:init/items/second_pass
#
# Initializes and normalizes items and item categories. Calculates total item
# weight for each category.
#
# @within
# 	function fetchr:init/items/lobby_loaded
# 	function fetchr:init/items/second_pass
# @writes storage fetchr:items categories

data modify storage tmp.fetchr:init itemCategories set from storage tmp.fetchr:init initializedItems[-1].categories
function fetchr:init/items/find_categories
data modify storage fetchr:items categories append from storage tmp.fetchr:init skippedCategories[]
data remove storage tmp.fetchr:init skippedCategories

data modify storage tmp.fetchr:init initializedItems[-1].item.tag.display.Lore append value '{"translate": "fetchr.categories.header", "color": "gray", "italic": false}'
data modify storage tmp.fetchr:init currentCategories set from storage tmp.fetchr:init categories
data remove storage tmp.fetchr:init currentCategories[].items
data modify storage tmp.fetchr:init itemCategoriesCopy set from storage tmp.fetchr:init initializedItems[-1].categories
data remove storage tmp.fetchr:init initializedItems[-1].categories

function fetchr:init/items/add_category_info

data modify storage tmp.fetchr:init categories[].items append from storage tmp.fetchr:init initializedItems[-1]
function fetchr:init/items/set_category_specific
data remove storage tmp.fetchr:init categories

data modify storage fetchr:items items append from storage tmp.fetchr:init initializedItems[-1]
data remove storage tmp.fetchr:init initializedItems[-1]

execute if data storage tmp.fetchr:init initializedItems[0] run function fetchr:init/items/second_pass