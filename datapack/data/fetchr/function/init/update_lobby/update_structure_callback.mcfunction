#> fetchr:init/update_lobby/update_structure_callback
#
# Callback to run after all the chunks are forceloaded.
#
# @within fetchr:init/update_lobby/setup_structure

execute \
	at @e[type=#fetchr:marker_entity, tag=fetchr.multiplayer_door] \
	run fill ~ ~ ~ ~ ~1 ~ minecraft:air
execute \
	at @e[type=#fetchr:marker_entity, tag=fetchr.lobby_sign] \
	run setblock ~ ~ ~ minecraft:air
execute \
	at @e[type=#fetchr:marker_entity, tag=fetchr.lobby_lectern] \
	run setblock ~ ~ ~ minecraft:air
execute \
	at @e[type=#fetchr:marker_entity, tag=fetchr.lobby_enderchest] \
	run setblock ~ ~ ~ minecraft:air
execute \
	at @e[type=#fetchr:marker_entity, tag=fetchr.mangrove_button_south] \
	run setblock ~ ~ ~ minecraft:air
execute \
	at @e[type=#fetchr:marker_entity, tag=fetchr.chest_generation_marker] \
	run function fetchr:init/update_lobby/reset_category_chests

scoreboard players set $init/lobby/update.compare_z fetchr.tmp -30000000
scoreboard players operation $init/lobby/update.compare_z fetchr.tmp -= $init/lobby/update.old_z fetchr.tmp
scoreboard players operation $init/lobby/update.compare_z fetchr.tmp += $init/lobby/update.new_z fetchr.tmp
execute \
	if score $init/lobby/update.compare_z fetchr.tmp matches ..-30000001 \
	run scoreboard players set $init/lobby/update.compare_z fetchr.tmp -30000000

scoreboard players operation $init/lobby/update.x_diff fetchr.tmp = $init/lobby/update.old_size_x fetchr.tmp
scoreboard players operation $init/lobby/update.x_diff fetchr.tmp -= $init/lobby/update.new_size_x fetchr.tmp
scoreboard players operation $init/lobby/update.clone_from_x fetchr.tmp = $init/lobby/update.old_x fetchr.tmp
execute \
	if score $init/lobby/update.x_diff fetchr.tmp matches 1.. \
	run scoreboard players operation $init/lobby/update.clone_from_x fetchr.tmp += $init/lobby/update.x_diff fetchr.tmp
execute \
	if score $init/lobby/update.x_diff fetchr.tmp matches ..-1 \
	run scoreboard players operation $init/lobby/update.clone_x fetchr.tmp -= $init/lobby/update.x_diff fetchr.tmp

data modify storage tmp.fetchr:init/update_lobby update_coordinates set value {}
data \
	modify storage tmp.fetchr:init/update_lobby update_coordinates.structure_id \
	set from storage tmp.fetchr:init/update_lobby structures[-1].id
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.compare_z int 1 \
	run scoreboard players get $init/lobby/update.compare_z fetchr.tmp

execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.new_y int 1 \
	run scoreboard players get $init/lobby/update.new_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.y int 1 \
	run scoreboard players get $init/lobby/update.y fetchr.tmp
scoreboard players set $init/lobby/update.y_above_barriers fetchr.tmp 3
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.y_above_barriers int 1 \
	run scoreboard players operation $init/lobby/update.y_above_barriers fetchr.tmp > $init/lobby/update.y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.z int 1 \
	run scoreboard players get $init/lobby/update.z fetchr.tmp

execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.size_x int 1 \
	run scoreboard players get $init/lobby/update.new_size_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.old_size_x int 1 \
	run scoreboard players get $init/lobby/update.old_size_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.size_y int 1 \
	run scoreboard players get $init/lobby/update.size_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.size_z int 1 \
	run scoreboard players get $init/lobby/update.size_z fetchr.tmp

scoreboard players operation $init/lobby/update.offset_x fetchr.tmp = $init/lobby/update.new_size_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.offset_x int 1 \
	run scoreboard players remove $init/lobby/update.offset_x fetchr.tmp 1

scoreboard players operation $init/lobby/update.offset_old_x fetchr.tmp = $init/lobby/update.old_size_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.offset_old_x int 1 \
	run scoreboard players remove $init/lobby/update.offset_old_x fetchr.tmp 1

scoreboard players operation $init/lobby/update.offset_y fetchr.tmp = $init/lobby/update.size_y fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.offset_y int 1 \
	run scoreboard players remove $init/lobby/update.offset_y fetchr.tmp 1

scoreboard players operation $init/lobby/update.offset_y_above_barriers fetchr.tmp = $init/lobby/update.offset_y fetchr.tmp
scoreboard players operation $init/lobby/update.offset_y_above_barriers fetchr.tmp -= $init/lobby/update.new_y_above_barriers fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.offset_y_above_barriers int 1 \
	run scoreboard players operation $init/lobby/update.offset_y_above_barriers fetchr.tmp += $init/lobby/update.new_y fetchr.tmp

scoreboard players operation $init/lobby/update.offset_z fetchr.tmp = $init/lobby/update.size_z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.offset_z int 1 \
	run scoreboard players remove $init/lobby/update.offset_z fetchr.tmp 1
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.clone_from_x int 1 \
	run scoreboard players get $init/lobby/update.clone_from_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.old_x int 1 \
	run scoreboard players get $init/lobby/update.old_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.clone_x int 1 \
	run scoreboard players get $init/lobby/update.clone_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.reference_x int 1 \
	run scoreboard players get $init/lobby/update.reference_x fetchr.tmp

scoreboard players operation \
	$init/lobby/update.reference_to_old_x_offset fetchr.tmp \
	= $init/lobby/update.old_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.reference_to_old_x_offset int 1 \
	run scoreboard players operation \
		$init/lobby/update.reference_to_old_x_offset fetchr.tmp \
		-= $init/lobby/update.reference_x fetchr.tmp

scoreboard players operation \
	$init/lobby/update.compare_to_clone_x_offset fetchr.tmp \
	= $init/lobby/update.clone_x fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.compare_to_clone_x_offset int 1 \
	run scoreboard players add $init/lobby/update.compare_to_clone_x_offset fetchr.tmp 29999999
scoreboard players operation \
	$init/lobby/update.compare_to_clone_z_offset fetchr.tmp \
	= $init/lobby/update.z fetchr.tmp
execute \
	store result storage tmp.fetchr:init/update_lobby update_coordinates.compare_to_clone_z_offset int 1 \
	run scoreboard players add $init/lobby/update.compare_to_clone_z_offset fetchr.tmp 30000000

execute \
	in fetchr:lobby \
	run function fetchr:init/update_lobby/update_structure \
		with storage tmp.fetchr:init/update_lobby update_coordinates