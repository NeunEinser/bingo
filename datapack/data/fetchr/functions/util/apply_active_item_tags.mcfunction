#> fetchr:util/apply_active_item_tags
#
# Call this function to apply changes to the activeTags array of storage
# fetchr:items 
#
# @api
# @reads storage fetchr:items activeTags
# @writes storage fetchr:items activeCategories
# @writes storage fetchr:items activeItems

#>
# @within
# 	function fetchr:util/apply_active_item_tags
# 	function fetchr:util/apply_active_item_tags/**
#declare storage tmp.fetchr:apply_active_item_tags

scoreboard players set $available_category_weight fetchr.state 1

data modify storage fetchr:items activeItems set value []
data modify storage fetchr:items activeCategories set value []

data modify storage tmp.fetchr:apply_active_item_tags activeItems set value []
data modify storage tmp.fetchr:apply_active_item_tags categories set from storage fetchr:items categories
function fetchr:util/apply_active_item_tags/find_next_category
function fetchr:util/apply_active_item_tags/add_categories_and_items

data modify storage tmp.fetchr:apply_active_item_tags items set value []
data modify storage tmp.fetchr:apply_active_item_tags items append from storage tmp.fetchr:apply_active_item_tags activeItems[{multipleCategories: true}]
data remove storage tmp.fetchr:apply_active_item_tags activeItems[{multipleCategories: true}]
function fetchr:util/apply_active_item_tags/prepare_items_with_multiple_categories

scoreboard players set $total_item_weight fetchr.state 0
function fetchr:util/apply_active_item_tags/calculate_global_weight_and_add

function fetchr:lobby/chest_generation/generate_item_chests