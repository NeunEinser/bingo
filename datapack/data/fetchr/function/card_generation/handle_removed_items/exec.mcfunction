#> fetchr:card_generation/handle_removed_items/exec
#
# Adjusts total_weight according to removed item
#
# @within
# 	function fetchr:card_generation/cleanup_and_next_slot
# 	function fetchr:card_generation/handle_removed_items/exec

#>
# The current item's weight to adjust the remaining total weight
#
# @private
#declare score_holder $card_gen/handle_removed_items.weight

execute \
	store result score $card_gen/handle_removed_items.weight fetchr.tmp \
	run data get storage tmp.fetchr:card_generation removed_items[-1].weight
scoreboard players operation $card_gen.total_weight fetchr.tmp -= $card_gen/handle_removed_items.weight fetchr.tmp

data \
	modify storage tmp.fetchr:card_generation item_categories \
	set from storage tmp.fetchr:card_generation removed_items[-1].active_categories
execute \
	if data storage tmp.fetchr:card_generation item_categories[0] \
	run function fetchr:card_generation/handle_removed_items/add_category_with_removed_item \
		with storage tmp.fetchr:card_generation item_categories[-1]

data remove storage tmp.fetchr:card_generation removed_items[-1]
execute \
	if data storage tmp.fetchr:card_generation removed_items[0] \
	run function fetchr:card_generation/handle_removed_items/exec