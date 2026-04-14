#> fetchr:init/update_lobby/update_entity/find_entity_at_position
#
# Try to find entity of the correct type by coordinates.
#
# @within
# 	function fetchr:init/update_lobby/update_entity/handle_reference
# @params
# 	entity_type: #[id=entity_type] string,
# @context postion The location the entity is expected at

$execute as @e[\
		type=$(entity_type),\
		distance=...1,\
	] \
	unless data entity @s data.fetchr.display_entity_id \
	run return run function fetchr:init/update_lobby/update_entity/handle_old