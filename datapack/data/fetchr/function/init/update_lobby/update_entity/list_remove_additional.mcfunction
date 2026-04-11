#> fetchr:init/update_lobby/update_entity/list_remove_additional
#
# Removes additional list elements that are present in the reference entity but
# not the new entity from the old entity
#
# @within
# 	function fetchr:init/update_lobby/update_entity/iterate_list
# 	function fetchr:init/update_lobby/update_entity/list_remove_additional
# @params
# 	path: string The relative path starting from the entity itself to the current list
# 	index: int The first index to remove in the old entity

$data remove storage tmp.fetchr:init/update_lobby old_entity$(path)[$(index)]

scoreboard players remove $init/lobby/update/entity.size_reference fetchr.tmp 1

execute \
	if score $init/lobby/update/entity.size_new fetchr.tmp < $init/lobby/update/entity.size_reference fetchr.tmp \
	run function fetchr:init/update_lobby/update_entity/list_remove_additional \
		with storage tmp.fetchr:init/update_lobby entity_path_data