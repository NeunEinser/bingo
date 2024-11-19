#> fetchr:item_detection/find_inventory_item/inventory_slots
#
# Finds the exact item stack for clearing
#
# @params ::fetchr::storage::card::CardSlot
# @within function fetchr:item_detection/check_and_announce/*

$execute \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.0 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.0"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.1 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.1"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.2 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.2"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.3 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.3"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.4 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.4"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.5 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.5"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.6 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.6"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.7 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.7"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.8 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.8"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.9 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.9"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.10 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.10"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.11 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.11"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.12 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.12"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.13 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.13"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.14 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.14"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.15 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.15"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.16 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.16"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.17 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.17"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.18 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.18"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.19 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.19"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.20 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.20"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.21 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.21"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.22 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.22"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.23 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.23"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.24 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.24"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.25 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.25"
$execute \
	if score $item_detect.found_item fetchr.tmp matches 0 \
	store success score $item_detect.found_item fetchr.tmp \
	if items entity @s inventory.26 $(command_argument) \
	run data modify storage tmp.fetchr:item_detect slot set value "inventory.26"