#> fetchr:init/update_lobby/update_entity/handle_reference
#
# Handles the reference entity that was found. In case no old entity is found,
# will still act like no reference was fund either
#
# @within
# 	function fetchr:init/update_lobby/update_entity/handle_reference
# @context
# 	entity The reference entity that was found
# @output
# 	score $init/lobby/update/entity.found_reference fetchr.tmp
# 		1 if entity was found, 0 otherwise
# @params
# 	entity_id: #[id] string,
# 	entity_type: #[id=entity_type] string,
# 	y: int @ 0..64,
# 	z: int @ -30000000..29999999,
# 	reference_x: int @ -30000000..29999999,
# 	size_x: int @ 0..60000000,
# 	size_y: int @ 0..64,
# 	size_z: int @ 0..60000000,
# 	old_x: int @ -30000000..29999999,
# 	reference_to_old_x_offset: int @ -60000000..60000000,
# @returns 1 if entity was found, 0 otherwise

scoreboard players set $init/lobby/update/entity.found_reference fetchr.tmp 1
tag @s add fetchr.matched
data modify storage tmp.fetchr:init/update_lobby reference_entity set from entity @s

$execute \
	as @e[\
		type=$(entity_type),\
		x=$(old_x),y=$(y),z=$(z),\
		dx=$(offset_old_x_including_overlap),dy=$(offset_y),dz=$(offset_z),\
		nbt={data: {fetchr: { display_entity_id: "$(entity_id)" }}},\
		limit=1\
	] \
	run return run function fetchr:init/update_lobby/update_entity/handle_old
$execute \
	as @e[\
		type=minecraft:marker,\
		x=$(old_x),y=$(y),z=$(z),\
		dx=$(offset_old_x_including_overlap),dy=$(offset_y),dz=$(offset_z),\
		nbt={data: {fetchr: { display_entity_id: "$(entity_id)" }}},\
		limit=1\
	] \
	at @s \
	as @n[type=!minecraft:marker, distance=...1] \
	run return run function fetchr:init/update_lobby/update_entity/handle_old

# Entity with same id was not found above, look for entity with the same type
# at the coordinates it is expected at as fallback
# TODO: Maybe only do this if we have a legacy structure id set? This should
#       only happen for cases were a lobby was generated in a version that did
#       not have this logic

data remove storage tmp.fetchr:init/update_lobby old_entity
$execute \
	at @s \
	positioned ~$(reference_to_old_x_offset) ~ ~ \
	run function fetchr:init/update_lobby/update_entity/find_entity_at_position \
		with storage tmp.fetchr:init/update_lobby update_coordinates

execute \
	if data storage tmp.fetchr:init/update_lobby old_entity \
	run return 1

scoreboard players set $init/lobby/update/entity.found_reference fetchr.tmp 0
tag @s remove fetchr.matched
return fail