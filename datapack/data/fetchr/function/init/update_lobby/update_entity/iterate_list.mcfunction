#> fetchr:init/update_lobby/update_entity/iterate_list
#
# Iterates the current list corresponding to the path and updates all data in
# all indicies, and removes indicies that no longer exist, and appends new
# list entries
#
# @within
# 	function fetchr:init/update_lobby/update_entity/update_path
# 	function fetchr:init/update_lobby/update_entity/iterate_list
# @input
# 	storage tmp.fetchr:init/update_lobby entity_path_data
# @params
# 	path: string The relative path starting from the entity itself.
# 	index: int The current index to check

# Generate sub path
data \
	modify storage io.fetchr:util concat_strings.first \
	set from storage tmp.fetchr:init/update_lobby entity_path_data.path
$data modify storage io.fetchr:util concat_strings.second set value "[$(index)]"
function fetchr:util/string/concat

data modify storage tmp.fetchr:init/update_lobby entity_path_data.path set from storage io.fetchr:util string

# Stash data to retrive after recursion
execute \
	store result storage tmp.fetchr:init/update_lobby entity_data_stack[-1].index int 1 \
	run scoreboard players add $init/lobby/update/entity.list_index fetchr.tmp 1

data modify storage tmp.fetchr:init/update_lobby entity_path_data.index set value 0
# Recurse
function fetchr:init/update_lobby/update_entity/update_path \
	with storage tmp.fetchr:init/update_lobby entity_path_data

# Check if one of the lists ran out, handle tail, and stop iteration
execute \
	store result score $init/lobby/update/entity.list_index fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby entity_data_stack[-1].index

$execute \
	store result score $init/lobby/update/entity.size_new fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby new_entity$(path)

$execute \
	store result score $init/lobby/update/entity.size_reference fetchr.tmp \
	run data get storage tmp.fetchr:init/update_lobby reference_entity$(path)


scoreboard players operation $init/lobby/update/entity.size fetchr.tmp = $init/lobby/update/entity.size_new fetchr.tmp
scoreboard players operation $init/lobby/update/entity.size fetchr.tmp < $init/lobby/update/entity.size_reference fetchr.tmp

data \
	modify storage tmp.fetchr:init/update_lobby entity_path_data.path \
	set from storage tmp.fetchr:init/update_lobby entity_data_stack[-1].path

execute \
	if score $init/lobby/update/entity.list_index fetchr.tmp < $init/lobby/update/entity.size fetchr.tmp \
	run data \
		modify storage tmp.fetchr:init/update_lobby entity_path_data.index \
		set from storage tmp.fetchr:init/update_lobby entity_data_stack[-1].index

execute \
	if score $init/lobby/update/entity.list_index fetchr.tmp >= $init/lobby/update/entity.size fetchr.tmp \
	if score $init/lobby/update/entity.size_new fetchr.tmp > $init/lobby/update/entity.size_reference fetchr.tmp \
	run function fetchr:init/update_lobby/update_entity/list_append_remaining \
		with storage tmp.fetchr:init/update_lobby entity_path_data

execute \
	if score $init/lobby/update/entity.list_index fetchr.tmp >= $init/lobby/update/entity.size fetchr.tmp \
	if score $init/lobby/update/entity.size_new fetchr.tmp < $init/lobby/update/entity.size_reference fetchr.tmp \
	run function fetchr:init/update_lobby/update_entity/list_remove_additional \
		with storage tmp.fetchr:init/update_lobby entity_path_data

execute \
	if score $init/lobby/update/entity.list_index fetchr.tmp >= $init/lobby/update/entity.size fetchr.tmp \
	run return run data remove storage tmp.fetchr:init/update_lobby entity_data_stack[-1]

# iterate
function fetchr:init/update_lobby/update_entity/iterate_list \
	with storage tmp.fetchr:init/update_lobby entity_path_data