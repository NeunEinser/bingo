#> fetchr:item_detection/find_inventory_item/armor_slots
#
# Finds the exact item stack for clearing
#
# @params ::fetchr::storage::card::CardSlot
# @within function fetchr:item_detection/check_and_announce/*

$execute \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s armor.feet $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "armor.feet"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s armor.legs $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "armor.legs"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s armor.body $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "armor.body"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s armor.head $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "armor.head"