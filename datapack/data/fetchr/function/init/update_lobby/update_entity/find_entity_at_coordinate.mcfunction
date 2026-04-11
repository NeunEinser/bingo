#> fetchr:init/update_lobby/update_entity/find_entity_at_coordinate
#
# Try to find entity of the correct type by coordinates.
#
# @within
# 	function fetchr:init/update_lobby/update_entity/handle_reference
# @params
# 	entity_type: #[id=entity_type] string,
# 	entity_x: int @ -30000000..29999999,
# 	entity_y: double @ -30000000..29999999,
# 	entity_z: double @ -30000000..29999999,

$execute as @e[\
		type=$(entity_type),\
		x=$(entity_x),y=$(entity_y),z=$(entity_z),\
		distance=...1,\
	] \
	unless data entity @s data.fetchr.display_entity_id \
	run return run function fetchr:init/update_lobby/update_entity/handle_old