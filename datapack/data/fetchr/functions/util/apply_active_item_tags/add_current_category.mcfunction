#> fetchr:util/apply_active_item_tags/add_current_category
#
# This function adds the current category from the current item's internal
# category reference list, which includes the item-specific weight.
#
# @within
# 	function fetchr:util/apply_active_item_tags/add_items_from_category
# 	function fetchr:util/apply_active_item_tags/add_current_category

#>
# @private
#declare score_holder $apply_tags/add_item_cat.incorrect_cat

data modify storage tmp.fetchr:apply_active_item_tags category set from storage tmp.fetchr:apply_active_item_tags categories[-1].id
execute store result score $apply_tags/add_item_cat.incorrect_cat fetchr.tmp run data modify storage tmp.fetchr:apply_active_item_tags category set from storage tmp.fetchr:apply_active_item_tags itemCategories[-1].id

execute unless score $apply_tags/add_item_cat.incorrect_cat fetchr.tmp matches 1 run data modify storage tmp.fetchr:apply_active_item_tags activeItems[-1].activeCategories append from storage tmp.fetchr:apply_active_item_tags itemCategories[-1]

data remove storage tmp.fetchr:apply_active_item_tags itemCategories[-1]
execute if score $apply_tags/add_item_cat.incorrect_cat fetchr.tmp matches 1 run function fetchr:util/apply_active_item_tags/add_current_category