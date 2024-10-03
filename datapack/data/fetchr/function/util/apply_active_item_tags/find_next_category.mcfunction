#> fetchr:util/apply_active_item_tags/find_next_category
#
# Finds the next category
#
# @within
# 	fetchr:util/apply_active_item_tags
# 	fetchr:util/apply_active_item_tags/add_categories_and_items
# 	fetchr:util/apply_active_item_tags/find_next_category
# @writes storage tmp.fetchr:apply_active_item_tags categories

#>
# @within function fetchr:util/apply_active_item_tags/find_next_category
# @within function fetchr:util/apply_active_item_tags/check_category
# @within function fetchr:util/apply_active_item_tags/check_current_tag
#declare score_holder $apply_tags.category_excluded
scoreboard players set $apply_tags.category_excluded fetchr.tmp 1
data modify storage tmp.fetchr:apply_active_item_tags activeTags set from storage fetchr:items activeTags
execute if data storage tmp.fetchr:apply_active_item_tags categories[-1].items[0] run function fetchr:util/apply_active_item_tags/check_category

execute if score $apply_tags.category_excluded fetchr.tmp matches 1 run data remove storage tmp.fetchr:apply_active_item_tags categories[-1]
execute if score $apply_tags.category_excluded fetchr.tmp matches 1 if data storage tmp.fetchr:apply_active_item_tags categories[0] run function fetchr:util/apply_active_item_tags/find_next_category