#> fetchr:init/update_lobby/update_entity/update_path
#
# Compares the path in the new entity with the one in the old entity and updates
# it if applicable.
#
# For compunds and lists, this will leave all values that did not change between
# new and reference unchanged in the old entity, and only patch values that have
# been modified between new and reference.
#
# @within
# 	function fetchr:init/update_lobby/update_entity/exec
# 	function fetchr:init/update_lobby/update_entity/iterate_compound
# 	function fetchr:init/update_lobby/update_entity/iterate_list
# @params
# 	path: string The relative path starting from the entity itself.

$execute \
	unless data storage tmp.fetchr:init/update_lobby new_entity$(path) \
	run data remove storage tmp.fetchr:init/update_lobby old_entity$(path)
$execute \
	unless data storage tmp.fetchr:init/update_lobby new_entity$(path) \
	run return 0

$execute \
	unless data storage tmp.fetchr:init/update_lobby reference_entity$(path) \
	run data \
		modify storage tmp.fetchr:init/update_lobby old_entity$(path) \
		set from storage tmp.fetchr:init/update_lobby new_entity$(path)

$execute \
	unless data storage tmp.fetchr:init/update_lobby reference_entity$(path) \
	run return 0

scoreboard players set $init/lobby/update/entity.is_different fetchr.tmp 0
$data \
	modify storage tmp.fetchr:init/update_lobby data_comparision \
	set from storage tmp.fetchr:init/update_lobby reference_entity$(path)

$execute \
	store success score $init/lobby/update/entity.is_different fetchr.tmp \
	run data \
		modify storage tmp.fetchr:init/update_lobby data_comparision \
		set from storage tmp.fetchr:init/update_lobby new_entity$(path)

execute \
	if score $init/lobby/update/entity.is_different fetchr.tmp matches 0 \
	run return 0

$data \
	modify storage tmp.fetchr:init/update_lobby entity_data_stack \
	append from storage tmp.fetchr:init/update_lobby reference_entity$(path)
$data \
	modify storage tmp.fetchr:init/update_lobby entity_data_stack[-1] \
	merge from storage tmp.fetchr:init/update_lobby new_entity$(path)

$data \
	modify storage tmp.fetchr:init/update_lobby stash_to_check_if_compound_which_is_needed_because_mojank_thinks_mc_139625_works_as_intended_mad_neun \
	set from storage tmp.fetchr:init/update_lobby reference_entity$(path)

execute \
	if data storage tmp.fetchr:init/update_lobby data_comparision{} \
	if data storage tmp.fetchr:init/update_lobby stash_to_check_if_compound_which_is_needed_because_mojank_thinks_mc_139625_works_as_intended_mad_neun{} \
	run return run function fetchr:init/update_lobby/update_entity/iterate_compound \
		with storage tmp.fetchr:init/update_lobby entity_path_data

scoreboard players set $init/lobby/update/entity.list_index fetchr.tmp 0
execute \
	if data storage tmp.fetchr:init/update_lobby data_comparision[0] \
	if data storage tmp.fetchr:init/update_lobby stash_to_check_if_compound_which_is_needed_because_mojank_thinks_mc_139625_works_as_intended_mad_neun[0] \
	run return run function fetchr:init/update_lobby/update_entity/iterate_list \
		with storage tmp.fetchr:init/update_lobby entity_path_data

data remove storage tmp.fetchr:init/update_lobby entity_data_stack[-1]
$data \
	modify storage tmp.fetchr:init/update_lobby old_entity$(path) \
	set from storage tmp.fetchr:init/update_lobby new_entity$(path)