#> fetchr:init/update_lobby/update_structure
#
# Updates the structure
#
# @within fetchr:init/update_lobby/update_structure_callback
# @context dimension fetchr:lobby
# @params
# 	structure_id: #[id=structure] string
# 	compare_z: int @ -30000000..29999999
# 	compare_y: int @ -3..0
# 	old_x: int @ -30000000..29999999
# 	old_y: int @ 0..64
# 	old_z: int @ -30000000..29999999
# 	old_high_x: int @ -30000000..29999999
# 	old_high_y: int @ 0..64
# 	old_high_z: int @ -30000000..29999999
# 	clone_x: int @ -30000000..29999999

#NEUN_SCRIPT until 62
#$execute \
	positioned -29999999 $(compare_y_above_barriers) $(compare_z) \
	run fill ~ ~ ~ ~$(offset_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air
#$execute \
	positioned -29999999 0 $(compare_z) \
	run fill ~ 0 ~ ~$(offset_x) 2 ~$(offset_z) minecraft:barrier
#$place template $(structure_id) -29999999 $(compare_y) $(compare_z)
#$execute \
	positioned $(old_x) $(old_y) $(old_z) \
	run clone ~ ~ ~ \
		~$(offset_x) ~$(offset_y) ~$(offset_z) \
		$(clone_x) $(old_y) $(old_z) \
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$execute \
	positioned -29999999 $(compare_y_above_barriers) $(compare_z) \
	run fill ~ ~ ~ ~$(offset_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air strict
$execute \
	positioned -29999999 0 $(compare_z) \
	run fill ~ 0 ~ ~$(offset_x) 2 ~$(offset_z) minecraft:barrier strict
$place template $(structure_id) -29999999 $(compare_y) $(compare_z) none none 1 1 strict
$say execute \
	positioned $(old_x) $(old_y) $(old_z) \
	run clone ~ ~ ~ \
		~$(offset_x) ~$(offset_y) ~$(offset_z) \
		$(clone_x) $(old_y) $(old_z) \
		strict
$execute \
	positioned $(old_x) $(old_y) $(old_z) \
	run clone ~ ~ ~ \
		~$(offset_x) ~$(offset_y) ~$(offset_z) \
		$(clone_x) $(old_y) $(old_z) \
		strict
#NEUN_SCRIPT end
data modify storage tmp.fetchr:init/update_lobby compare_coordinates set value [{\
	compare_x: -29999999,\
	compare_z: -30000000\
}]

execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].y int 1 \
	run scoreboard players get $init/lobby/update.y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].size_x int 1 \
	run scoreboard players get $init/lobby/update.new_size_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].size_y int 1 \
	run scoreboard players get $init/lobby/update.size_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].size_z int 1 \
	run scoreboard players get $init/lobby/update.size_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].offset_x int 1 \
	run scoreboard players get $init/lobby/update.offset_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].offset_y int 1 \
	run scoreboard players get $init/lobby/update.offset_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].offset_z int 1 \
	run scoreboard players get $init/lobby/update.offset_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].reference_x int 1 \
	run scoreboard players get $init/lobby/update.reference_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].reference_z int 1 \
	run scoreboard players get $init/lobby/update.z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].clone_x int 1 \
	run scoreboard players get $init/lobby/update.clone_x fetchr.tmp

function fetchr:init/update_lobby/compare_and_update/x_iter \
	with storage tmp.fetchr:init/update_lobby compare_coordinates[0]

scoreboard players operation $init/lobby/update.clone_x fetchr.tmp += $init/lobby/update.new_size_x fetchr.tmp

data remove storage tmp.fetchr:init/update_lobby structures[-1]
execute \
	if data storage tmp.fetchr:init/update_lobby structures[0] \
	run function fetchr:init/update_lobby/setup_structure