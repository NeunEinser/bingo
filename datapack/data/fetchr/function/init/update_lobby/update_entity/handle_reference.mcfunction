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
# @returns 1 if entity was found, 0 otherwise

scoreboard players set $init/lobby/update/entity.found_reference fetchr.tmp 1
tag @s add fetchr.matched
data modify storage tmp.fetchr:init/update_lobby reference_entity set from entity @s

$execute \
	as @e[\
		type=$(entity_type),\
		x=$(old_x),y=$(y),z=$(z),\
		dx=$(size_x),dy=$(size_y),dz=$(size_z),\
		nbt={data: {fetchr: { display_entity_id: "$(entity_id)" }}},\
		limit=1\
	] \
	if function fetchr:init/update_lobby/update_entity/handle_old \
	run return 1
$execute \
	as @e[\
		type=#fetchr:marker_entity,\
		x=$(old_x),y=$(y),z=$(z),\
		dx=$(size_x),dy=$(size_y),dz=$(size_z),\
		nbt={data: {fetchr: { display_entity_id: "$(entity_id)" }}},\
		limit=1\
	] \
	on vehicle \
	if function fetchr:init/update_lobby/update_entity/handle_old \
	run return 1

# Entity with same id was not found above, look for entity with the same type
# at the coordinates it is expected at as fallback
# TODO: Maybe only do this if we have a legacy structure id set? This should
#       only happen for cases were a lobby was generated in a version that did
#       not have this logic 
data \
	modify storage tmp.fetchr:init/update_lobby update_entity.entity_x \
	set from entity @s Pos[0]
data \
	modify storage tmp.fetchr:init/update_lobby update_entity.entity_y \
	set from entity @s Pos[1]
data \
	modify storage tmp.fetchr:init/update_lobby update_entity.entity_z \
	set from entity @s Pos[2]
execute \
	store result score $init/lobby/update/entity.x fetchr.tmp \
	run data get entity @s Pos[0]

scoreboard players operation $init/lobby/update/entity.x fetchr.tmp -= $init/lobby/update.reference_x fetchr.tmp
scoreboard players operation $init/lobby/update/entity.x fetchr.tmp += $init/lobby/update.old_x fetchr.tmp
data \
	modify storage tmp.fetchr:init/update_lobby double.value \
	set from storage tmp.fetchr:init/update_lobby update_entity.entity_x

function fetchr:init/update_lobby/update_entity/get_decimal \
	with storage tmp.fetchr:init/update_lobby double
execute \
	store result storage tmp.fetchr:init/update_lobby decimal_parts.integer int 1 \
	run scoreboard players get $init/lobby/update/entity.x fetchr.tmp
function fetchr:init/update_lobby/update_entity/set_entity_x \
	with storage tmp.fetchr:init/update_lobby decimal_parts

data remove storage tmp.fetchr:init/update_lobby old_entity
function fetchr:init/update_lobby/update_entity/find_entity_at_coordinate \
	with storage tmp.fetchr:init/update_lobby update_entity

execute \
	if data storage tmp.fetchr:init/update_lobby old_entity \
	run return 1

scoreboard players set $init/lobby/update/entity.found_reference fetchr.tmp 0
tag @s remove fetchr.matched
return fail