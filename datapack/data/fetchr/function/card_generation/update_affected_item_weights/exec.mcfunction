#> fetchr:card_generation/update_affected_item_weights/exec
#
# In case items where removed in the handle_removed_items function that
# have multiple categories, the weight of items that are in those secondary
# categories have to be recalculated.
#
# The recalculation of global item weights will fail in case the current
# available category weight does not make an even split possible for some items.
#
# This case will be handled by the recalculate_item_weight functions.
#
# @within function fetchr:card_generation/cleanup_and_next_slot


data modify storage tmp.fetchr:card_generation category_items set value []
function fetchr:card_generation/update_affected_item_weights/find_items \
	with storage tmp.fetchr:card_generation categories_with_removed_item[-1]

scoreboard players set $card_gen.required_category_weight fetchr.tmp 1
function fetchr:card_generation/update_affected_item_weights/update_weights

#>
# @private
#declare score_holder $card_gen.requires_item_recalc
scoreboard players operation $card_gen.requires_item_recalc fetchr.tmp = $card_gen.available_category_weight fetchr.tmp
scoreboard players operation $card_gen.requires_item_recalc fetchr.tmp %= $card_gen.required_category_weight fetchr.tmp

execute \
	unless score $card_gen.requires_item_recalc fetchr.tmp matches 0 \
	run function fetchr:card_generation/recalculate_item_weight/exec