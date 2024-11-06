#> fetchr:item_detection/on_inventory_changed
#
# This function is called when the inventory of the player changed
#
# @within advancement fetchr:inventory_changed
# @context entity Player

execute \
	if score $game_state fetchr.state matches 3 \
	if predicate fetchr:is_in_game \
	run function fetchr:item_detection/check_all_slots

advancement revoke @s only fetchr:inventory_changed