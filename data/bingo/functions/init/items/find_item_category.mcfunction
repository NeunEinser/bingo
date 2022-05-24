#> bingo:init/items/find_item_category
#
# Finds the item category of the searched category
# 
# Deletes all unmatched categories that come before the correct category from
# the itemCategories list.
#
# @within
# 	function bingo:init/items/*
# @input
# 	storage tmp.bingo:init searchedCategory the id of the searched category
# 	storage tmp.bingo:init itemCategories the item categories to search
# @writes storage tmp.bingo:init itemCategories
# @output storage tmp.bingo:init itemCategories[-1]

#>
# Indicates whether the current category is different from the searched one.
#
# @private
#declare score_holder $init/items/find_cat.is_different

data modify storage tmp.bingo:init category set from storage tmp.bingo:init searchedCategory
execute store success score $init/items/find_cat.is_different bingo.tmp run data modify storage tmp.bingo:init category set from storage tmp.bingo:init itemCategories[-1].id

execute if score $init/items/find_cat.is_different bingo.tmp matches 1 run data remove storage tmp.bingo:init itemCategories[-1]
execute if score $init/items/find_cat.is_different bingo.tmp matches 1 run function bingo:init/items/find_item_category