#> fetchr:util/apply_active_item_tags/add_items_from_category
#
# Adds all items of the current category to activeItems
#
# @within
# 	fetchr:util/apply_active_item_tags/add_categories_and_items
# 	fetchr:util/apply_active_item_tags/add_items_from_category
# @writes storage tmp.fetchr:apply_active_item_tags activeItems

#>
# @within
# 	function fetchr:util/apply_active_item_tags/add_items_from_category
# 	function fetchr:util/apply_active_item_tags/find_already_added_item
#declare score_holder $apply_tags.item_does_not_exists
scoreboard players set $apply_tags.item_does_not_exists fetchr.tmp 1

data remove storage tmp.fetchr:apply_active_item_tags checkedItems[]
execute if data storage tmp.fetchr:apply_active_item_tags categories[-1].items[-1].categories[1] if data storage tmp.fetchr:apply_active_item_tags activeItems[0] run function fetchr:util/apply_active_item_tags/find_already_added_item

data modify storage tmp.fetchr:apply_active_item_tags activeItems append from storage tmp.fetchr:apply_active_item_tags checkedItems[]

execute if score $apply_tags.item_does_not_exists fetchr.tmp matches 1 run data modify storage tmp.fetchr:apply_active_item_tags activeItems append from storage tmp.fetchr:apply_active_item_tags categories[-1].items[-1]
execute if score $apply_tags.item_does_not_exists fetchr.tmp matches 1 run data modify storage tmp.fetchr:apply_active_item_tags activeItems[-1].activeCategories set value []
execute if score $apply_tags.item_does_not_exists fetchr.tmp matches 1 run data modify storage tmp.fetchr:apply_active_item_tags activeItems[-1].weightDenom set from storage tmp.fetchr:apply_active_item_tags categories[-1].total_item_weight
execute if score $apply_tags.item_does_not_exists fetchr.tmp matches 1 run data modify storage tmp.fetchr:apply_active_item_tags activeItems[-1].weightNom set from storage tmp.fetchr:apply_active_item_tags activeItems[-1].weight

execute if score $apply_tags.item_does_not_exists fetchr.tmp matches 0 run function fetchr:util/apply_active_item_tags/modify_existing_item
data modify storage tmp.fetchr:apply_active_item_tags item_categories set from storage tmp.fetchr:apply_active_item_tags activeItems[-1].categories
function fetchr:util/apply_active_item_tags/add_current_category

data remove storage tmp.fetchr:apply_active_item_tags categories[-1].items[-1]
execute if data storage tmp.fetchr:apply_active_item_tags categories[-1].items[0] run function fetchr:util/apply_active_item_tags/add_items_from_category