#> fetchr:init/update_lobby/update_entity/list_append_remaining
#
# Appends the remaining list indicies that did not previously exist in reference
# to the old entity
#
# @within
# 	function fetchr:init/update_lobby/update_entity/iterate_list
# 	function fetchr:init/update_lobby/update_entity/list_append_remaining
# @writes
# 	storage tmp.fetchr:init/update_lobby entity_path_data
# @params
# 	path: string The relative path starting from the entity itself to the current list
# 	index: int The current index to append to new

$data \
	modify storage tmp.fetchr:init/update_lobby old_entity$(path) \
	append from storage tmp.fetchr:init/update_lobby new_entity$(path)[$(index)]

scoreboard players add $init/lobby/update/entity.size_reference fetchr.tmp 1

execute \
	store result storage tmp.fetchr:init/update_lobby entity_path_data.index int 1 \
	run scoreboard players add $init/lobby/update/entity.list_index fetchr.tmp 1

execute \
	if score $init/lobby/update/entity.size_new fetchr.tmp > $init/lobby/update/entity.size_reference fetchr.tmp \
	run function fetchr:init/update_lobby/update_entity/list_append_remaining \
		with storage tmp.fetchr:init/update_lobby entity_path_data