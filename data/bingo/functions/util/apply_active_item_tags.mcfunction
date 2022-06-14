#> bingo:util/apply_active_item_tags
#
# Call this function to apply changes to the activeTags array of storage
# bingo:items 
#
# @api
# @reads storage bingo:items activeTags
# @writes storage bingo:items activeCategories
# @writes storage bingo:items activeItems

#>
# @within
# 	function bingo:util/apply_active_item_tags
# 	function bingo:util/apply_active_item_tags/**
#declare storage tmp.bingo:apply_active_item_tags

scoreboard players set $available_category_weight bingo.state 1

data modify storage bingo:items activeItems set value []
data modify storage bingo:items activeCategories set value []

data modify storage tmp.bingo:apply_active_item_tags activeItems set value []
data modify storage tmp.bingo:apply_active_item_tags categories set from storage bingo:items categories
function bingo:util/apply_active_item_tags/find_next_category
function bingo:util/apply_active_item_tags/add_categories_and_items

data modify storage tmp.bingo:apply_active_item_tags items set value []
data modify storage tmp.bingo:apply_active_item_tags items append from storage tmp.bingo:apply_active_item_tags activeItems[{multipleCategories: true}]
data remove storage tmp.bingo:apply_active_item_tags activeItems[{multipleCategories: true}]
function bingo:util/apply_active_item_tags/prepare_items_with_multiple_categories

scoreboard players set $total_item_weight bingo.state 0
function bingo:util/apply_active_item_tags/calculate_global_weight_and_add

function bingo:lobby/chest_generation/generate_item_chests