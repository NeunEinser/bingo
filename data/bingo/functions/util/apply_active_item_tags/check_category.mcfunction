#> bingo:util/apply_active_item_tags/check_category
#
# Checks if categories[-1].tags contains any activeTag
#
# @within
# 	bingo:util/apply_active_item_tags/find_next_category
# 	bingo:util/apply_active_item_tags/check_category
# @reads storage tmp.bingo:apply_active_item_tags categories[-1]
# @writes storage tmp.bingo:apply_active_item_tags activeTags

data modify storage tmp.bingo:apply_active_item_tags tags set from storage tmp.bingo:apply_active_item_tags categories[-1].tags
function bingo:util/apply_active_item_tags/check_current_tag

data remove storage tmp.bingo:apply_active_item_tags activeTags[-1]

execute if score $apply_tags.category_excluded bingo.tmp matches 1 if data storage tmp.bingo:apply_active_item_tags activeTags[0] run function bingo:util/apply_active_item_tags/check_category