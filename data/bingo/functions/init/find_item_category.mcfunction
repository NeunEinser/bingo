#> bingo:init/find_item_category
#
# Copies the category specific weight to the item in the category
#
# @within
# 	function bingo:init/copy_category_specific
# 	function bingo:init/find_item_category

#>
# Indicates whether the current category is different from the searched one.
#
# @private
#declare score_holder $init/find_cat.is_different

data modify storage tmp.bingo:init category set from storage tmp.bingo:init categories[-1].name
execute store success score $init/find_cat.is_different bingo.tmp run data modify storage tmp.bingo:init category set from storage tmp.bingo:init itemCategories[-1].id
execute unless data storage tmp.bingo:init itemCategories[-1].id store success score $init/find_cat.is_different bingo.tmp run data modify storage tmp.bingo:init category set from storage tmp.bingo:init itemCategories[-1]

execute if score $init/find_cat.is_different bingo.tmp matches 1 run data remove storage tmp.bingo:init itemCategories[-1]
execute if score $init/find_cat.is_different bingo.tmp matches 1 run function bingo:init/find_item_category