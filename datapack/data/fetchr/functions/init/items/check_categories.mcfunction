#> fetchr:init/items/check_categories
#
# Checks if the this item is part of the current category
#
# @reads storage fetchr:items categories[-1] the current category
# @input storage tmp.fetchr:init checkCategories List of categories the current item is in
# @output score $init/items/find_cat.is_different fetchr.tmp
# @within
# 	function fetchr:init/items/find_categories
# 	function fetchr:init/items/check_categories

#>
# Indicates whether the current category is different from the searched one.
#
# @within
# 	function fetchr:init/items/find_categories
# 	function fetchr:init/items/check_categories
#declare score_holder $init/items/find_cat.is_different

data modify storage tmp.fetchr:init category set from storage fetchr:items categories[-1].id
execute store success score $init/items/find_cat.is_different fetchr.tmp run data modify storage tmp.fetchr:init category set from storage tmp.fetchr:init checkCategories[-1].id

execute if score $init/items/find_cat.is_different fetchr.tmp matches 1 run data modify storage tmp.fetchr:init checkedCategories append from storage tmp.fetchr:init checkCategories[-1]
data remove storage tmp.fetchr:init checkCategories[-1]

execute if score $init/items/find_cat.is_different fetchr.tmp matches 1 if data storage tmp.fetchr:init checkCategories[0] run function fetchr:init/items/check_categories