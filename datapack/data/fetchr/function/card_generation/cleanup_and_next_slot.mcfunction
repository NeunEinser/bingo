#> fetchr:card_generation/cleanup_and_next_slot
#
# Performs cleanup after generating a slot. Not called for the last slot.
#
# @within function fetchr:card_generation/generate_slot

data \
	modify storage tmp.fetchr:card_generation item_categories \
	set from storage tmp.fetchr:card_generation items[-1].active_categories
data modify storage tmp.fetchr:card_generation removed_items set value []
function fetchr:card_generation/remove_items \
	with storage tmp.fetchr:card_generation item_categories[-1]

data modify storage tmp.fetchr:card_generation categories_with_removed_item set value []
function fetchr:card_generation/handle_removed_items/exec

#>
# @within
# 	function fetchr:card_generation/generate_slot
# 	function fetchr:card_generation/update_affected_item_weights/*
# 	function fetchr:card_generation/recalculate_item_weight/exec
#declare score_holder $card_gen.required_category_weight
execute \
	if data storage tmp.fetchr:card_generation categories_with_removed_item[0] \
	run function fetchr:card_generation/update_affected_item_weights/exec

scoreboard players add $card_gen.slot fetchr.tmp 1
function fetchr:card_generation/generate_slot