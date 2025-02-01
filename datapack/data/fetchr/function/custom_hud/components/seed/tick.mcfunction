#> fetchr:custom_hud/components/seed/tick
#
# @within tag/function fetchr:tick_hud_components
# @handles #fetchr:tick_hud_components

execute \
	if score $update_card fetchr.state matches 1 \
	if data storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:seed" }] \
	run function fetchr:custom_hud/components/seed/update
execute \
	if score @s fetchr.update_hud matches 1 \
	if data storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:seed" }] \
	run function fetchr:custom_hud/components/seed/update