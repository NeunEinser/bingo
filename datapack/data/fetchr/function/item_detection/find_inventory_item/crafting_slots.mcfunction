#> fetchr:item_detection/find_inventory_item/crafting_slots
#
# Finds the exact item stack for clearing
#
# @params ::fetchr::storage::card::CardSlot
# @within function fetchr:item_detection/check_and_announce/*

$execute \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s player.crafting.0 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "player.crafting.0"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s player.crafting.1 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "player.crafting.1"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s player.crafting.2 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "player.crafting.2"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s player.crafting.3 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "player.crafting.3"
