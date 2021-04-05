#> bingo:init/add_to_categories
#
# Adds the item to all categories it belongs to.
#
# @within
# 	function bingo:init/fill_categories
# 	function bingo:init/add_to_categories
# @writes storage bingo:items categories

function bingo:init/find_category
execute unless score $init/find_cat.category_exists bingo.tmp matches 0 run data modify storage temp:bingo.init categories[-1].items append from storage temp:bingo.init items[-1]

data remove storage temp:bingo.init itemCategories[-1]
data modify storage bingo:items categories append from storage temp:bingo.init categories[]
data remove storage temp:bingo.init categories
execute if data storage temp:bingo.init itemCategories[0] run function bingo:init/add_to_categories