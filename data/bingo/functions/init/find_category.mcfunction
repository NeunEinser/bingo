#> bingo:init/find_category
#
# Finds the currrent category.
#
# Moves the category to the end of temp:bingo.init categories. All categories
# that come before that will also be somewhere in that array and will be removed
# from the original array.
#
# This means, at the end, all categories in that array need to be added back to
# the original list
#
# @within
# 	function bingo:init/add_to_categories
# 	function bingo:init/find_category
# @writes storage bingo:items categories
# @output storage temp:bingo.init categories

#>
# Indicates whether a category was checked in this iteration.
#
# @within
# 	function bingo:init/add_to_categories
# 	function bingo:init/find_category
#declare score_holder $init/find_cat.category_exists
#>
# Indicates whether the current category is different from the searched one.
#
# @private
#declare score_holder $init/find_cat.is_different

data modify storage temp:bingo.init categories append from storage bingo:items categories[-1]
execute store success score $init/find_cat.category_exists bingo.tmp run data remove storage bingo:items categories[-1]

execute if score $init/find_cat.category_exists bingo.tmp matches 0 run tellraw @a [{"text": "[ERROR] Could not find category ", "color": "red"}, {"storage": "temp:bingo.init", "nbt": "itemCategories[-1]"}, " of item ", {"storage": "temp:bingo.init", "nbt": "items[-1].id"}]

data modify storage temp:bingo.init category set from storage temp:bingo.init itemCategories[-1]
execute store success score $init/find_cat.is_different bingo.tmp run data modify storage temp:bingo.init category set from storage temp:bingo.init categories[-1].name

execute unless score $init/find_cat.is_different bingo.tmp matches 0 unless score $init/find_cat.category_exists bingo.tmp matches 0 run function bingo:init/find_category