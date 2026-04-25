#> fetchr:init/update_lobby/handle_special_blocks/check_door_id
#
# Compares doors more leniently to not drop them when they are for example open
#
# @within fetchr:init/update_lobby/handle_special_blocks/clone
# @context position old location
# @params
# 	y: int @ 0..64,
# 	z: int @ -30000000..29999999,
# 	compare_x: int @ -30000000..29999999,
# 	compare_z: int @ -30000000..29999999,
# 	reference_x: int @ -30000000..29999999,

$execute \
	if block $(reference_x) ~ ~ minecraft:acacia_door \
	if block ~ ~ ~ minecraft:acacia_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:bamboo_door \
	if block ~ ~ ~ minecraft:bamboo_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:birch_door \
	if block ~ ~ ~ minecraft:birch_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:cherry_door \
	if block ~ ~ ~ minecraft:cherry_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:crimson_door \
	if block ~ ~ ~ minecraft:crimson_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:dark_oak_door \
	if block ~ ~ ~ minecraft:dark_oak_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:jungle_door \
	if block ~ ~ ~ minecraft:jungle_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:pale_oak_door \
	if block ~ ~ ~ minecraft:pale_oak_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:spruce_door \
	if block ~ ~ ~ minecraft:spruce_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:warped_door \
	if block ~ ~ ~ minecraft:warped_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]

$execute \
	if block $(reference_x) ~ ~ minecraft:iron_door \
	if block ~ ~ ~ minecraft:iron_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]

$execute \
	if block $(reference_x) ~ ~ minecraft:copper_door \
	if block ~ ~ ~ minecraft:copper_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:exposed_copper_door \
	if block ~ ~ ~ minecraft:exposed_copper_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:weathered_copper_door \
	if block ~ ~ ~ minecraft:weathered_copper_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:oxidized_copper_door \
	if block ~ ~ ~ minecraft:oxidized_copper_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:waxed_copper_door \
	if block ~ ~ ~ minecraft:waxed_copper_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:waxed_exposed_copper_door \
	if block ~ ~ ~ minecraft:waxed_exposed_copper_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:waxed_weathered_copper_door \
	if block ~ ~ ~ minecraft:waxed_weathered_copper_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]
$execute \
	if block $(reference_x) ~ ~ minecraft:waxed_oxidized_copper_door \
	if block ~ ~ ~ minecraft:waxed_oxidized_copper_door \
	run function fetchr:init/update_lobby/handle_special_blocks/check_door_half \
		with storage tmp.fetchr:init/update_lobby compare_coordinates[-1]




