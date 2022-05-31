#> bingo:init/items/second_pass
#
# Initializes and normalizes items and item categories. Calculates total item
# weight for each category.
#
# @within
# 	function bingo:init/items/exec
# 	function bingo:init/items/second_pass
# @writes storage bingo:items categories

data modify storage tmp.bingo:init itemCategories set from storage tmp.bingo:init initializedItems[-1].categories
function bingo:init/items/find_categories
data modify storage bingo:items categories append from storage tmp.bingo:init skippedCategories[]
data remove storage tmp.bingo:init skippedCategories

data modify storage tmp.bingo:init initializedItems[-1].item.tag.display.Lore append value '{"translate": "bingo.categories.header", "color": "gray", "italic": false}'
data modify storage tmp.bingo:init currentCategories set from storage tmp.bingo:init categories
data remove storage tmp.bingo:init currentCategories[].items
data modify storage tmp.bingo:init itemCategoriesCopy set from storage tmp.bingo:init initializedItems[-1].categories
data remove storage tmp.bingo:init initializedItems[-1].categories

function bingo:init/items/add_category_info

data modify storage tmp.bingo:init categories[].items append from storage tmp.bingo:init initializedItems[-1]
function bingo:init/items/set_category_specific
data remove storage tmp.bingo:init categories

data modify storage bingo:items items append from storage tmp.bingo:init initializedItems[-1]
data remove storage tmp.bingo:init initializedItems[-1]

execute if data storage tmp.bingo:init initializedItems[0] run function bingo:init/items/second_pass