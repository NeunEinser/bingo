#> fetchr:item_detection/find_inventory_item/hotbar_slots
#
# Finds the exact item stack for clearing
#
# @params ::fetchr::storage::card::CardSlot
# @within function fetchr:item_detection/check_and_announce/*

$execute \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s hotbar.0 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "hotbar.0"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s hotbar.1 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "hotbar.1"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s hotbar.2 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "hotbar.2"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s hotbar.3 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "hotbar.3"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s hotbar.4 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "hotbar.4"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s hotbar.5 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "hotbar.5"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s hotbar.6 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "hotbar.6"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s hotbar.7 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "hotbar.7"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s hotbar.8 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "hotbar.8"