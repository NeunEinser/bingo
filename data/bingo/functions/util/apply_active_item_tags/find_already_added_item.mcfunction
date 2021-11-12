#> bingo:util/apply_active_item_tags/find_already_added_item
#
# Finds an already added version of the current item. This is used to prevent
# dubley adding items that are within multiple categories.
#
# @within
# 	bingo:util/apply_active_item_tags/add_items_from_category
# 	bingo:util/apply_active_item_tags/find_already_added_item
# @writes storage tmp.bingo:apply_active_item_tags activeItems

data modify storage tmp.bingo:apply_active_item_tags checkedItems append from storage tmp.bingo:apply_active_item_tags activeItems[-1]
data modify storage tmp.bingo:apply_active_item_tags itemCheck set from storage tmp.bingo:apply_active_item_tags categories[-1].items[-1].id
execute store success score $apply_tags.item_does_not_exists bingo.tmp run data modify storage tmp.bingo:apply_active_item_tags itemCheck set from storage tmp.bingo:apply_active_item_tags checkedItems[-1].id

data remove storage tmp.bingo:apply_active_item_tags activeItems[-1]
execute if score $apply_tags.item_does_not_exists bingo.tmp matches 1 if data storage tmp.bingo:apply_active_item_tags activeItems[0] run function bingo:util/apply_active_item_tags/find_already_added_item