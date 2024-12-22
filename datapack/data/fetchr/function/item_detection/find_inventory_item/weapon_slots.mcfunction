#> fetchr:item_detection/find_inventory_item/weapon_slots
#
# Finds the exact item stack for clearing
#
# @params ::fetchr::storage::card::CardSlot
# @within function fetchr:item_detection/check_and_announce/*

$execute \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s weapon.mainhand $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "weapon.mainhand"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s weapon.offhand $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "weapon.offhand"