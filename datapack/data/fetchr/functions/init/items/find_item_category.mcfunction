#> fetchr:init/items/find_item_category
#
# Finds the item category of the searched category
# 
# Deletes all unmatched categories that come before the correct category from
# the itemCategories list.
#
# @within
# 	function fetchr:init/items/*
# @input
# 	storage tmp.fetchr:init searchedCategory the id of the searched category
# 	storage tmp.fetchr:init itemCategories the item categories to search
# @writes storage tmp.fetchr:init itemCategories
# @output storage tmp.fetchr:init itemCategories[-1]

#>
# Indicates whether the current category is different from the searched one.
#
# @private
#declare score_holder $init/items/find_cat.is_different

data modify storage tmp.fetchr:init category set from storage tmp.fetchr:init searchedCategory
execute store success score $init/items/find_cat.is_different fetchr.tmp run data modify storage tmp.fetchr:init category set from storage tmp.fetchr:init itemCategories[-1].id

execute if score $init/items/find_cat.is_different fetchr.tmp matches 1 run data remove storage tmp.fetchr:init itemCategories[-1]
execute if score $init/items/find_cat.is_different fetchr.tmp matches 1 run function fetchr:init/items/find_item_category