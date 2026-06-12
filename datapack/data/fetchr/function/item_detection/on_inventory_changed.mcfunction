#> fetchr:item_detection/on_inventory_changed
#
# This function is called when the inventory of the player changed
#
# @within advancement fetchr:inventory_changed
# @context entity Player

execute \
	if score $game_state fetchr.state matches 4 \
	if predicate fetchr:is_in_game \
	if entity @s[gamemode=!spectator] \
	run function fetchr:item_detection/check_all_slots

execute \
	if score $game_state fetchr.state matches 2 \
	if entity @s[tag=fetchr.in_spawn_preview] \
	if score @s fetchr.spyglass_dropped matches 1.. \
	at @s \
	run function fetchr:game/spawn_preview/on_spyglass_dropped


advancement revoke @s only fetchr:inventory_changed