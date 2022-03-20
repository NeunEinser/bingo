#> bingo:util/apply_active_item_tags/find_next_category
#
# Finds the next category
#
# @within
# 	bingo:util/apply_active_item_tags
# 	bingo:util/apply_active_item_tags/add_categories_and_items
# 	bingo:util/apply_active_item_tags/find_next_category
# @writes storage tmp.bingo:apply_active_item_tags categories

#>
# @within function bingo:util/apply_active_item_tags/find_next_category
# @within function bingo:util/apply_active_item_tags/check_category
# @within function bingo:util/apply_active_item_tags/check_current_tag
#declare score_holder $apply_tags.category_excluded
scoreboard players set $apply_tags.category_excluded bingo.tmp 1
data modify storage tmp.bingo:apply_active_item_tags activeTags set from storage bingo:items activeTags
execute if data storage tmp.bingo:apply_active_item_tags categories[-1].items[0] run function bingo:util/apply_active_item_tags/check_category

execute if score $apply_tags.category_excluded bingo.tmp matches 1 run data remove storage tmp.bingo:apply_active_item_tags categories[-1]
execute if score $apply_tags.category_excluded bingo.tmp matches 1 if data storage tmp.bingo:apply_active_item_tags categories[0] run function bingo:util/apply_active_item_tags/find_next_category