#> bingo:init/items/check_categories
#
# Checks if the this item is part of the current category
#
# @reads storage bingo:items categories[-1] the current category
# @input storage tmp.bingo:init checkCategories List of categories the current item is in
# @output score $init/items/find_cat.is_different bingo.tmp
# @within
# 	function bingo:init/items/find_categories
# 	function bingo:init/items/check_categories

#>
# Indicates whether the current category is different from the searched one.
#
# @within
# 	function bingo:init/items/find_categories
# 	function bingo:init/items/check_categories
#declare score_holder $init/items/find_cat.is_different

data modify storage tmp.bingo:init category set from storage bingo:items categories[-1].id
execute store success score $init/items/find_cat.is_different bingo.tmp run data modify storage tmp.bingo:init category set from storage tmp.bingo:init checkCategories[-1].id

execute if score $init/items/find_cat.is_different bingo.tmp matches 1 run data modify storage tmp.bingo:init checkedCategories append from storage tmp.bingo:init checkCategories[-1]
data remove storage tmp.bingo:init checkCategories[-1]

execute if score $init/items/find_cat.is_different bingo.tmp matches 1 if data storage tmp.bingo:init checkCategories[0] run function bingo:init/items/check_categories