#> bingo:init/items/find_item_category
#
# Copies the category specific weight to the item in the category
#
# @within
# 	function bingo:init/items/set_category_specific
# 	function bingo:init/items/find_item_category

#>
# Indicates whether the current category is different from the searched one.
#
# @private
#declare score_holder $init/items/find_cat.is_different

data modify storage tmp.bingo:init category set from storage tmp.bingo:init categories[-1].id
execute store success score $init/items/find_cat.is_different bingo.tmp run data modify storage tmp.bingo:init category set from storage tmp.bingo:init itemCategories[-1].id

execute if score $init/items/find_cat.is_different bingo.tmp matches 1 run data remove storage tmp.bingo:init itemCategories[-1]
execute if score $init/items/find_cat.is_different bingo.tmp matches 1 run function bingo:init/items/find_item_category