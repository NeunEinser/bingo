#> fetchr:init/update_lobby/update_entity/find_corresponding_in_reference
#
# Tries to find an entity in the reference structure matching the display
# entity id from the current entity that is being handled.
#
# Allows for display entity id to be stored in marker passenger as well for
# older versions that did not support custom data on any entity.
#
# @within
# 	function fetchr:init/update_lobby/update_entity/exec
# @context
# 	dimension fetchr:lobby
# @params
# 	entity_id: #[id] string,
# 	entity_type: #[id=entity_type] string,
# 	y: int @ 0..64,
# 	z: int @ -30000000..29999999,
# 	reference_x: int @ -30000000..29999999,
# 	size_x: int @ 0..60000000,
# 	size_y: int @ 0..64,
# 	size_z: int @ 0..60000000,

scoreboard players set $init/lobby/update/entity.found_reference fetchr.tmp 0
$execute \
	as @e[\
		type=$(entity_type),\
		x=$(reference_x),y=$(y),z=$(z),\
		dx=$(size_x),dy=$(size_y),dz=$(size_z),\
		nbt={data: {fetchr: { display_entity_id: "$(entity_id)" }}},\
		limit=1\
	] \
	run function fetchr:init/update_lobby/update_entity/handle_reference \
		with storage tmp.fetchr:init/update_lobby update_entity
execute \
	unless score $init/lobby/update/entity.found_reference fetchr.tmp matches 0 \
	run return 1

$execute \
	as @e[\
		type=#fetchr:marker_entity,\
		x=$(reference_x),y=$(y),z=$(z),\
		dx=$(size_x),dy=$(size_y),dz=$(size_z),\
		nbt={data: {fetchr: { display_entity_id: "$(entity_id)" }}},\
		limit=1\
	] \
	on vehicle \
	run return run function fetchr:init/update_lobby/update_entity/handle_reference \
		with storage tmp.fetchr:init/update_lobby update_entity

return fail