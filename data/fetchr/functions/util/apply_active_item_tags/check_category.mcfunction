#> fetchr:util/apply_active_item_tags/check_category
#
# Checks if categories[-1].tags contains any activeTag
#
# @within
# 	fetchr:util/apply_active_item_tags/find_next_category
# 	fetchr:util/apply_active_item_tags/check_category
# @reads storage tmp.fetchr:apply_active_item_tags categories[-1]
# @writes storage tmp.fetchr:apply_active_item_tags activeTags

data modify storage tmp.fetchr:apply_active_item_tags tags set from storage tmp.fetchr:apply_active_item_tags categories[-1].tags
function fetchr:util/apply_active_item_tags/check_current_tag

data remove storage tmp.fetchr:apply_active_item_tags activeTags[-1]

execute if score $apply_tags.category_excluded fetchr.tmp matches 1 if data storage tmp.fetchr:apply_active_item_tags activeTags[0] run function fetchr:util/apply_active_item_tags/check_category