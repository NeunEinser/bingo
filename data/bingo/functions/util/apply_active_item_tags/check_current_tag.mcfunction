#> bingo:util/apply_active_item_tags/check_current_tag
#
# Checks if tags contains activeTags[-1]
#
# @within
# 	bingo:util/apply_active_item_tags/check_category
# 	bingo:util/apply_active_item_tags/check_current_tag
# @reads storage tmp.bingo:apply_active_item_tags activeTags[-1]
# @writes storage tmp.bingo:apply_active_item_tags tags

data modify storage tmp.bingo:apply_active_item_tags currentTag set from storage tmp.bingo:apply_active_item_tags activeTags[-1]
execute store success score $apply_tags.category_excluded bingo.tmp run data modify storage tmp.bingo:apply_active_item_tags currentTag set from storage tmp.bingo:apply_active_item_tags tags[-1]

data remove storage tmp.bingo:apply_active_item_tags tags[-1]
execute if score $apply_tags.category_excluded bingo.tmp matches 1 if data storage tmp.bingo:apply_active_item_tags tags[0] run function bingo:util/apply_active_item_tags/check_current_tag