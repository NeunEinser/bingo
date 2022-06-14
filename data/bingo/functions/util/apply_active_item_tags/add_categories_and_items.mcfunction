#> bingo:util/apply_active_item_tags/add_categories_and_items
#
# Adds items for one category
#
# @within
# 	bingo:util/apply_active_item_tags
# 	bingo:util/apply_active_item_tags/add_categories_and_items
# @reads storage bingo:items activeTags
# @writes storage bingo:items activeCategories
# @writes storage tmp.bingo:apply_active_item_tags activeItems

data modify storage bingo:items activeCategories append from storage tmp.bingo:apply_active_item_tags categories[-1]
function bingo:util/apply_active_item_tags/add_items_from_category

#>
# @private
#declare score_holder $apply_tags.category_weight
execute store result score $apply_tags.category_weight bingo.tmp run data get storage tmp.bingo:apply_active_item_tags categories[-1].totalItemWeight

scoreboard players operation $gcd.a 91.math.io = $available_category_weight bingo.state
scoreboard players operation $gcd.b 91.math.io = $apply_tags.category_weight bingo.tmp
function neun_einser.math:greatest_common_divisor

scoreboard players operation $apply_tags.category_weight bingo.tmp /= $gcd.result 91.math.io
scoreboard players operation $available_category_weight bingo.state *= $apply_tags.category_weight bingo.tmp

data remove storage tmp.bingo:apply_active_item_tags categories[-1]
function bingo:util/apply_active_item_tags/find_next_category

execute if data storage tmp.bingo:apply_active_item_tags categories[0] run function bingo:util/apply_active_item_tags/add_categories_and_items