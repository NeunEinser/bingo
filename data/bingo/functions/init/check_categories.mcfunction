#> bingo:init/check_categories
#
# Checks if the this item is part of the current category
#
# @reads storage bingo:items categories[-1] the current category
# @input storage tmp.bingo:init checkCategories List of categories the current item is in
# @output score $init/find_cat.is_different bingo.tmp
# @within
# 	function bingo:init/find_categories
# 	function bingo:init/check_categories

#>
# Indicates whether the current category is different from the searched one.
#
# @within
# 	function bingo:init/find_categories
# 	function bingo:init/check_categories
#declare score_holder $init/find_cat.is_different

data modify storage tmp.bingo:init category set from storage bingo:items categories[-1].name
execute if data storage tmp.bingo:init checkCategories[-1].id store success score $init/find_cat.is_different bingo.tmp run data modify storage tmp.bingo:init category set from storage tmp.bingo:init checkCategories[-1].id
execute unless data storage tmp.bingo:init checkCategories[-1].id store success score $init/find_cat.is_different bingo.tmp run data modify storage tmp.bingo:init category set from storage tmp.bingo:init checkCategories[-1]

execute if score $init/find_cat.is_different bingo.tmp matches 1 run data modify storage tmp.bingo:init checkedCategories append from storage tmp.bingo:init checkCategories[-1]
data remove storage tmp.bingo:init checkCategories[-1]

execute if score $init/find_cat.is_different bingo.tmp matches 1 if data storage tmp.bingo:init checkCategories[0] run function bingo:init/check_categories