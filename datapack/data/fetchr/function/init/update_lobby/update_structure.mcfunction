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
#$place template $(structure_id) -29999999 $(compare_y) $(compare_z)
#$clone \
	$(old_x) $(old_y) $(old_z) \
	$(old_high_x) $(old_high_y) $(old_high_z) \
	$(clone_x) $(old_y) $(old_z) \
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$place template $(structure_id) -29999999 $(compare_y) $(compare_z) none none 1 1 strict
$clone \
	$(old_x) $(old_y) $(old_z) \
	$(old_high_x) $(old_high_y) $(old_high_z) \
	$(clone_x) $(old_y) $(old_z) \
	strict
#NEUN_SCRIPT end
data modify storage tmp.fetchr:init/structures compare_coordinates set value [{\
	compare_x: -29999999,\
	compare_z: -30000000\
}]

execute \
	store result storage tmp.fetchr:init/structures compare_coordinates[0].y int 1 \
	run scoreboard players get $init/lobby/update.y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures compare_coordinates[0].size_x int 1 \
	run scoreboard players get $init/lobby/update.new_size_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures compare_coordinates[0].size_y int 1 \
	run scoreboard players get $init/lobby/update.size_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures compare_coordinates[0].size_z int 1 \
	run scoreboard players get $init/lobby/update.size_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures compare_coordinates[0].reference_x int 1 \
	run scoreboard players get $init/lobby/update.reference_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures compare_coordinates[0].reference_z int 1 \
	run scoreboard players get $init/lobby/update.z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/structures compare_coordinates[0].clone_x int 1 \
	run scoreboard players get $init/lobby/update.clone_x fetchr.tmp

function fetchr:init/update_lobby/compare_and_update/x_iter \
	with storage tmp.fetchr:init/structures compare_coordinates[0]