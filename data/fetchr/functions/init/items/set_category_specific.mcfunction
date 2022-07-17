#> fetchr:init/items/set_category_specific
#
# Sets category-specific attributes.
#
# @within
# 	function fetchr:init/items/second_pass
# 	function fetchr:init/items/set_category_specific

data modify storage tmp.fetchr:init itemCategories set from storage tmp.fetchr:init initializedItems[-1].categories
data modify storage tmp.fetchr:init searchedCategory set from storage tmp.fetchr:init categories[-1].id
function fetchr:init/items/find_item_category

data modify storage tmp.fetchr:init categories[-1].items[-1].weight set from storage tmp.fetchr:init itemCategories[-1].weight

data modify storage fetchr:items categories append from storage tmp.fetchr:init categories[-1]
data remove storage tmp.fetchr:init categories[-1]

execute if data storage tmp.fetchr:init categories[0] run function fetchr:init/items/set_category_specific