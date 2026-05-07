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

# Place compare structure and clone old to clone area
#NEUN_SCRIPT until 62
#$place template $(structure_id) -29999999 $(new_y) $(compare_z) none none 1 1
#$execute \
	positioned $(clone_from_x) $(y) $(z) \
	run clone ~ ~ ~ \
		~$(offset_x_for_clone) ~$(offset_y) ~$(offset_z) \
		$(clone_to_x) ~ ~
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$place template $(structure_id) -29999999 $(new_y) $(compare_z) none none 1 1 strict
$execute \
	positioned $(clone_from_x) $(y) $(z) \
	run clone ~ ~ ~ \
		~$(offset_x_for_clone) ~$(offset_y) ~$(offset_z) \
		$(clone_to_x) ~ ~ \
		strict
#NEUN_SCRIPT end

# Compare and update
data modify storage tmp.fetchr:init/update_lobby compare_coordinates set value [{\
	compare_z: -30000000\
}]

scoreboard players set $init/lobby/update.compare_x fetchr.tmp -29999999
execute \
	if score $init/lobby/update.x_diff fetchr.tmp matches ..-1 \
	run scoreboard players operation $init/lobby/update.compare_x fetchr.tmp -= $init/lobby/update.x_diff fetchr.tmp

execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].compare_x int 1 \
	run scoreboard players get $init/lobby/update.compare_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].y int 1 \
	run scoreboard players get $init/lobby/update.y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].offset_x int 1 \
	run scoreboard players get $init/lobby/update.offset_x_for_clone fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].offset_y int 1 \
	run scoreboard players get $init/lobby/update.offset_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].offset_z int 1 \
	run scoreboard players get $init/lobby/update.offset_z fetchr.tmp
scoreboard players operation $init/lobby/update.reference_for_clone_x fetchr.tmp = $init/lobby/update.reference_x fetchr.tmp
execute \
	if score $init/lobby/update.x_diff fetchr.tmp matches 1.. \
	run scoreboard players operation $init/lobby/update.reference_for_clone_x fetchr.tmp += $init/lobby/update.x_diff fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].reference_x int 1 \
	run scoreboard players get $init/lobby/update.reference_for_clone_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].z int 1 \
	run scoreboard players get $init/lobby/update.z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby compare_coordinates[0].clone_x int 1 \
	run scoreboard players get $init/lobby/update.clone_to_x fetchr.tmp

function fetchr:init/update_lobby/compare_and_update/x_iter \
	with storage tmp.fetchr:init/update_lobby compare_coordinates[0]

# In case structure size increased, copy increased area from compare area
#NEUN_SCRIPT until 62
#$execute \
	if score $init/lobby/update.x_diff fetchr.tmp matches ..-1 \
	positioned -29999999 $(new_y) $(compare_z) \
	run clone ~ ~ ~ ~$(x_diff_offset) ~$(offset_y) ~$(offset_z) $(clone_x) ~ $(new_z)
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$execute \
	if score $init/lobby/update.x_diff fetchr.tmp matches ..-1 \
	positioned -29999999 $(new_y) $(compare_z) \
	run clone ~ ~ ~ ~$(x_diff_offset) ~$(offset_y) ~$(offset_z) $(clone_x) ~ $(new_z) strict
#NEUN_SCRIPT end

# Update entities
$execute \
	as @e[x=-29999999,y=$(new_y),z=$(compare_z),dx=$(offset_x_including_overlap),dy=$(offset_y),dz=$(offset_z)] \
	at @s \
	run function fetchr:init/update_lobby/update_entity/exec \
		with storage tmp.fetchr:init/update_lobby update_coordinates

$execute \
	as @e[tag=!fetchr.matched,x=$(reference_x),y=$(y),z=$(z),dx=$(offset_x),dy=$(offset_y),dz=$(offset_z)] \
	run function fetchr:init/update_lobby/update_entity/kill_removed_entity

# Reset compare area
#NEUN_SCRIPT until 62
#$execute \
	positioned -29999999 $(y_above_barriers) $(compare_z) \
	run fill ~ ~ ~ ~$(offset_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air
#$execute \
	positioned -29999999 0 $(compare_z) \
	run fill ~ 0 ~ ~$(offset_x) 2 ~$(offset_z) minecraft:barrier
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$execute \
	if score $init/lobby/update.offset_y_above_barriers fetchr.tmp matches 0.. \
	positioned -29999999 $(y_above_barriers) $(compare_z) \
	run fill ~ ~ ~ ~$(offset_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air strict
$execute \
	positioned -29999999 0 $(compare_z) \
	run fill ~ 0 ~ ~$(offset_x) 2 ~$(offset_z) minecraft:barrier strict
#NEUN_SCRIPT end
$teleport @e[x=-29999999,y=$(new_y),z=$(compare_z),dx=$(offset_x_including_overlap),dy=$(offset_y),dz=$(offset_z)] 0 -127 0
kill @e[x=0.5,y=-127,z=0.5,distance=...1]

# Delete old and reference
data modify storage tmp.fetchr:init/update_lobby spawn_items_coordinates set value [{}]

execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0].y int 1 \
	run scoreboard players get $init/lobby/update.y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0].z int 1 \
	run scoreboard players get $init/lobby/update.z fetchr.tmp
scoreboard players operation $init/lobby/update.spawn_items_offset fetchr.tmp = $init/lobby/update.x_diff fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0].offset_x int 1 \
	run scoreboard players remove $init/lobby/update.spawn_items_offset fetchr.tmp 1
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0].offset_y int 1 \
	run scoreboard players get $init/lobby/update.offset_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0].offset_z int 1 \
	run scoreboard players get $init/lobby/update.offset_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0].old_x int 1 \
	run scoreboard players get $init/lobby/update.old_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0].reference_x int 1 \
	run scoreboard players get $init/lobby/update.reference_x fetchr.tmp

execute \
	if score $init/lobby/update.x_diff fetchr.tmp matches 1.. \
	run function fetchr:init/update_lobby/spawn_items_for_player_placed_blocks/x_iter \
		with storage tmp.fetchr:init/update_lobby spawn_items_coordinates[0]

#NEUN_SCRIPT until 62
#$execute \
	if score $init/lobby/update.y fetchr.tmp matches ..2 \
	positioned $(old_x) $(y) $(z) \
	run fill ~ ~ ~ ~$(offset_old_x) 2 ~$(offset_z) minecraft:barrier
#$execute \
	if score $init/lobby/update.offset_y_above_barriers fetchr.tmp matches 0.. \
	positioned $(old_x) $(y_above_barriers) $(z) \
	run fill ~ ~ ~ ~$(offset_old_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$execute \
	if score $init/lobby/update.y fetchr.tmp matches ..2 \
	positioned $(old_x) $(y) $(z) \
	run fill ~ ~ ~ ~$(offset_old_x) 2 ~$(offset_z) minecraft:barrier strict
$execute \
	if score $init/lobby/update.offset_y_above_barriers fetchr.tmp matches 0.. \
	positioned $(old_x) $(y_above_barriers) $(z) \
	run fill ~ ~ ~ ~$(offset_old_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air strict
#NEUN_SCRIPT end
$kill @e[type=minecraft:marker,x=$(old_x),y=$(y),z=$(z),dx=$(offset_old_x),dy=$(offset_y),dz=$(offset_z)]
$kill @e[type=minecraft:item_frame,tag=fetchr.card_frame,x=$(old_x),y=$(y),z=$(z),dx=$(offset_old_x),dy=$(offset_y),dz=$(offset_z)]

#NEUN_SCRIPT until 62
#$execute \
	if score $init/lobby/update.y fetchr.tmp matches ..2 \
	positioned $(reference_x) $(y) $(z) \
	run fill ~ ~ ~ ~$(offset_old_x) 2 ~$(offset_z) minecraft:barrier
#$execute \
	if score $init/lobby/update.offset_y_above_barriers fetchr.tmp matches 0.. \
	positioned $(reference_x) $(y_above_barriers) $(z) \
	run fill ~ ~ ~ ~$(offset_old_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
$execute \
	if score $init/lobby/update.y fetchr.tmp matches ..2 \
	positioned $(reference_x) $(y) $(z) \
	run fill ~ ~ ~ ~$(offset_old_x) 2 ~$(offset_z) minecraft:barrier strict
$execute \
	if score $init/lobby/update.offset_y_above_barriers fetchr.tmp matches 0.. \
	positioned $(reference_x) $(y_above_barriers) $(z) \
	run fill ~ ~ ~ ~$(offset_old_x) ~$(offset_y_above_barriers) ~$(offset_z) minecraft:air strict
#NEUN_SCRIPT end

$teleport @e[x=$(reference_x),y=$(y),z=$(z),dx=$(offset_old_x),dy=$(offset_y),dz=$(offset_z)] 0 -127 0
kill @e[x=0.5,y=-127,z=0.5,distance=...1]

# Continue with next structure
scoreboard players operation $init/lobby/update.clone_x fetchr.tmp += $init/lobby/update.new_size_x fetchr.tmp

data remove storage tmp.fetchr:init/update_lobby structures[-1]
execute \
	if data storage tmp.fetchr:init/update_lobby structures[0] \
	run return run function fetchr:init/update_lobby/setup_structure_update

function fetchr:init/update_lobby/move_clones_back