#> bingo:init/fill_categories
#
# This function adds all the items to their categories
#
# @within
# 	function bingo:init/init
# 	function bingo:init/fill_categories

data modify storage temp:bingo.init itemCategories set from storage temp:bingo.init items[-1].categories
function bingo:init/add_to_categories

data remove storage temp:bingo.init items[-1]
execute if data storage temp:bingo.init items[0] run function bingo:init/fill_categories