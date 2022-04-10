#> bingo:init/items/set_category_specific
#
# Sets category-specific attributes.
#
# @within
# 	function bingo:init/items/second_pass
# 	function bingo:init/items/set_category_specific

data modify storage tmp.bingo:init itemCategories set from storage tmp.bingo:init initializedItems[-1].categories
data modify storage tmp.bingo:init searchedCategory set from storage tmp.bingo:init categories[-1].id
function bingo:init/items/find_item_category

data modify storage tmp.bingo:init categories[-1].items[-1].weight set from storage tmp.bingo:init itemCategories[-1].weight

data modify storage bingo:items categories append from storage tmp.bingo:init categories[-1]
data remove storage tmp.bingo:init categories[-1]

execute if data storage tmp.bingo:init categories[0] run function bingo:init/items/set_category_specific