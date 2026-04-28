#> fetchr:init/update_lobby/spawn_items_for_player_placed_blocks/x_iter
#
# Compares old with reference along the x slice. Simply returns if equal, and
# searches for more changes in a binary tree along all x y and z coordiantes.
#
# @within
# 	function fetchr:init/update_lobby/update_structure
# 	function fetchr:init/update_lobby/update_structure/spawn_items/x_iter
# @context dimension fetchr:lobby
# @params
# 	y: int @ 0..64,
# 	z: int @ -30000000..29999999,
# 	reference_x: int @ -30000000..29999999,
# 	old_x: int @ -30000000..29999999,
# 	offset_x: int @ 0..60000000,
# 	offset_y: int @ 0..64,
# 	offset_z: int @ 0..60000000

$execute \
	positioned $(old_x) $(y) $(z) \
	if blocks ~ ~ ~ ~$(offset_x) ~$(offset_y) ~$(offset_z) $(reference_x) ~ ~ all \
	run return 0

execute \
	store result score $init/lobby/update/spawn_items.size_x fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-1].offset_x
scoreboard players add $init/lobby/update/spawn_items.size_x fetchr.tmp 1
execute \
	store result score $init/lobby/update/spawn_items.old_x fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-1].old_x
execute \
	store result score $init/lobby/update/spawn_items.reference_x fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-1].reference_x


# low
data \
	modify storage tmp.fetchr:init/update_lobby spawn_items_coordinates \
	append from storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-1]

scoreboard players operation $init/lobby/update/spawn_items.size_low_x fetchr.tmp = $init/lobby/update/spawn_items.size_x fetchr.tmp
scoreboard players operation $init/lobby/update/spawn_items.size_low_x fetchr.tmp /= 2 fetchr.const

scoreboard players operation $init/lobby/update/spawn_items.offset_low_x fetchr.tmp = $init/lobby/update/spawn_items.size_low_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-1].offset_x int 1 \
	run scoreboard players remove $init/lobby/update/spawn_items.offset_low_x fetchr.tmp 1

# high
data \
	modify storage tmp.fetchr:init/update_lobby spawn_items_coordinates \
	append from storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-2]

scoreboard players operation $init/lobby/update/spawn_items.size_high_x fetchr.tmp = $init/lobby/update/spawn_items.size_x fetchr.tmp
scoreboard players operation $init/lobby/update/spawn_items.size_high_x fetchr.tmp -= $init/lobby/update/spawn_items.size_low_x fetchr.tmp

scoreboard players operation $init/lobby/update/spawn_items.offset_high_x fetchr.tmp = $init/lobby/update/spawn_items.size_high_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-1].offset_x int 1 \
	run scoreboard players remove $init/lobby/update/spawn_items.offset_high_x fetchr.tmp 1
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-1].old_x int 1 \
	run scoreboard players operation $init/lobby/update/spawn_items.old_x fetchr.tmp += $init/lobby/update/spawn_items.size_low_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-1].reference_x int 1 \
	run scoreboard players operation $init/lobby/update/spawn_items.reference_x fetchr.tmp += $init/lobby/update/spawn_items.size_low_x fetchr.tmp


# recurse high
execute \
	if score $init/lobby/update/spawn_items.size_high_x fetchr.tmp matches 1 \
	run function fetchr:init/update_lobby/spawn_items_for_player_placed_blocks/z_iter \
		with storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-1]
execute \
	if score $init/lobby/update/spawn_items.size_high_x fetchr.tmp matches 2.. \
	run function fetchr:init/update_lobby/spawn_items_for_player_placed_blocks/x_iter \
		with storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-1]
data remove storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-1]

# recurse low
execute \
	store result score $init/lobby/update/spawn_items.offset_low_x fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-1].offset_x

execute \
	if score $init/lobby/update/spawn_items.offset_low_x fetchr.tmp matches 0 \
	run function fetchr:init/update_lobby/spawn_items_for_player_placed_blocks/z_iter \
		with storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-1]
execute \
	if score $init/lobby/update/spawn_items.offset_low_x fetchr.tmp matches 1.. \
	run function fetchr:init/update_lobby/spawn_items_for_player_placed_blocks/x_iter \
		with storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-1]
data remove storage tmp.fetchr:init/update_lobby spawn_items_coordinates[-1]