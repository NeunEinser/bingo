#> fetchr:init/update_lobby/update_entity/iterate_compound
#
# Iterates the current compound in storage tmp.fetchr:init/update_lobby
# entity_data_stack[-1] and compares all keys recursively.
#
# @within
# 	function fetchr:init/update_lobby/update_entity/update_path
# 	function fetchr:init/update_lobby/update_entity/iterate_compound
# @input
# 	storage tmp.fetchr:init/update_lobby entity_data_stack[-1]
# 	storage tmp.fetchr:init/update_lobby entity_path_data
# @params
# 	path: string The relative path starting from the entity itself.
# 	previously_handled_subkey: string The subkey that was handled by the previous
# 		iteration, or empty for the first iteration.

# Remove previous subkey if applicable
$execute \
	unless data storage tmp.fetchr:init/update_lobby entity_path_data{previously_handled_subkey: ""} \
	run data remove storage tmp.fetchr:init/update_lobby entity_data_stack[-1].data$(previously_handled_subkey)

# Get next subkey and prepend with dot, or stop iteration if empty compound
data modify storage io.fetchr:util nbt set from storage tmp.fetchr:init/update_lobby entity_data_stack[-1].data
function fetchr:util/string/get_next_compound_key

execute \
	if data storage io.fetchr:util { string: "" } \
	run data remove storage tmp.fetchr:init/update_lobby entity_data_stack[-1]
execute \
	if data storage io.fetchr:util { string: "" } \
	run return 0

data modify storage io.fetchr:util concat_strings.first set value "."
data \
	modify storage io.fetchr:util concat_strings.second \
	set from storage io.fetchr:util string
function fetchr:util/string/concat

# Save data to retrieve after recursion
data \
	modify storage tmp.fetchr:init/update_lobby entity_data_stack[-1].previously_handled_subkey \
	set from storage io.fetchr:util string

# Concat path
data modify storage io.fetchr:util concat_strings.first set from storage tmp.fetchr:init/update_lobby entity_path_data.path
data \
	modify storage io.fetchr:util concat_strings.first \
	set from storage tmp.fetchr:init/update_lobby entity_path_data.path
data \
	modify storage io.fetchr:util concat_strings.second \
	set from storage io.fetchr:util string
function fetchr:util/string/concat

# Recurse
data \
	modify storage tmp.fetchr:init/update_lobby entity_path_data.path \
	set from storage io.fetchr:util string
data modify storage tmp.fetchr:init/update_lobby entity_path_data.previously_handled_subkey set value ""

function fetchr:init/update_lobby/update_entity/update_path \
	with storage tmp.fetchr:init/update_lobby entity_path_data

# Iterate to next key
data \
	modify storage tmp.fetchr:init/update_lobby entity_path_data.path \
	set from storage tmp.fetchr:init/update_lobby entity_data_stack[-1].path
data \
	modify storage tmp.fetchr:init/update_lobby entity_path_data.previously_handled_subkey \
	set from storage tmp.fetchr:init/update_lobby entity_data_stack[-1].previously_handled_subkey

function fetchr:init/update_lobby/update_entity/iterate_compound with storage tmp.fetchr:init/update_lobby entity_path_data
