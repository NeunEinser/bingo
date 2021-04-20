#> bingo:init/find_categories
#
# Finds all categories this item belongs to
#
# Moves the categories to temp:bingo.init categories. All skipped categories
# will be part of skippedCategories.
#
# This means, at the end, all categories in that array need to be added back to
# the original list
#
# @within
# 	function bingo:init/initialize_items
# 	function bingo:init/find_categories
# @writes storage bingo:items categories
# @output storage temp:bingo.init categories

#>
# Indicates whether a category was checked in this iteration.
#
# @within
# 	function bingo:init/initialize_items
# 	function bingo:init/find_categories
#declare score_holder $init/find_cat.category_exists

data modify storage temp:bingo.init checkCategories set from storage temp:bingo.init itemCategories
data remove storage temp:bingo.init checkedCategories

function bingo:init/check_categories
data modify storage temp:bingo.init itemCategories set from storage temp:bingo.init checkCategories
data modify storage temp:bingo.init itemCategories append from storage temp:bingo.init checkedCategories[]

execute if score $init/find_cat.is_different bingo.tmp matches 1 run data modify storage temp:bingo.init skippedCategories append from storage bingo:items categories[-1]
execute if score $init/find_cat.is_different bingo.tmp matches 0 run data modify storage temp:bingo.init categories append from storage bingo:items categories[-1]
execute store success score $init/find_cat.category_exists bingo.tmp run data remove storage bingo:items categories[-1]

execute if score $init/find_cat.category_exists bingo.tmp matches 0 if data storage temp:bingo.init itemCategories[0] run tellraw @a [{"text": "[ERROR] Could not find categories [", "color": "red"}, {"storage": "temp:bingo.init", "nbt": "itemCategories[]"}, "] of item ", {"storage": "temp:bingo.init", "nbt": "items[-1].id"}]

execute unless score $init/find_cat.category_exists bingo.tmp matches 0 if data storage temp:bingo.init itemCategories[0] run function bingo:init/find_categories