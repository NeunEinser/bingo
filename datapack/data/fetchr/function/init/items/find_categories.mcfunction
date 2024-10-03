#> fetchr:init/items/find_categories
#
# Finds all categories this item belongs to
#
# Moves the categories to tmp.fetchr:init categories. All skipped categories
# will be part of skippedCategories.
#
# This means, at the end, all categories in that array need to be added back to
# the original list
#
# @within
# 	function fetchr:init/items/first_pass
# 	function fetchr:init/items/second_pass
# 	function fetchr:init/items/find_categories
# @writes storage fetchr:items categories
# @output storage tmp.fetchr:init categories

#>
# Indicates whether a category was checked in this iteration.
#
# @private
#declare score_holder $init/items/find_cat.category_exists

data modify storage tmp.fetchr:init checkCategories set from storage tmp.fetchr:init itemCategories
data remove storage tmp.fetchr:init checkedCategories

function fetchr:init/items/check_categories
data modify storage tmp.fetchr:init itemCategories set from storage tmp.fetchr:init checkCategories
data modify storage tmp.fetchr:init itemCategories append from storage tmp.fetchr:init checkedCategories[]

execute if score $init/items/find_cat.is_different fetchr.tmp matches 1 run data modify storage tmp.fetchr:init skippedCategories append from storage fetchr:items categories[-1]
execute if score $init/items/find_cat.is_different fetchr.tmp matches 0 run data modify storage tmp.fetchr:init categories append from storage fetchr:items categories[-1]
execute store success score $init/items/find_cat.category_exists fetchr.tmp run data remove storage fetchr:items categories[-1]

execute if score $init/items/find_cat.category_exists fetchr.tmp matches 0 run tellraw @a [{"text": "[", "color": "red"}, {"translate": "fetchr.logging.error"}, "] ", {"translate": "fetchr.setup.error.unknown_category", "with": [{"storage": "tmp.fetchr:init", "nbt": "items[-1].id"}, {"storage": "tmp.fetchr:init", "nbt": "category"}]}]

execute unless score $init/items/find_cat.category_exists fetchr.tmp matches 0 if data storage tmp.fetchr:init itemCategories[0] run function fetchr:init/items/find_categories