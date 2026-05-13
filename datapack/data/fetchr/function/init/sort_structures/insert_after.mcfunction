#> fetchr:init/sort_structures/insert_after
#
# Inserts the structure after another structure
#
# @within fetchr:init/sort_structures/exec

# If after_structure was already copied, find the insertion spot and insert
$execute \
	if data storage fetchr:registries structures[{id: "$(after_structure)"}] \
	run return run function fetchr:init/sort_structures/find_structure_insertion_spot

# If after_structure does not exist, just insert normally
$execute \
	unless data storage tmp.fetchr:init/sort_structures structures[{id: "$(after_structure)"}] \
	run return run function fetchr:init/sort_structures/insert

# If id and after_structure is the same, just insert normally
data \
	modify storage tmp.fetchr:init/sort_structures id_comparision \
	set from storage fetchr:structure structures[0].id
execute \
	store success score $init/structure.is_different fetchr.tmp \
	run data \
		modify storage tmp.fetchr:init/sort_structures id_comparision \
		set from storage fetchr:registries structures[-1].after_structure
execute \
	if score $init/structure.is_different fetchr.tmp matches 0 \
	run return run function fetchr:init/sort_structures/insert

# Else move up by one and handle next structure first, and try again after
data \
	modify storage tmp.fetchr:init/sort_structures structures \
	insert 2 from storage tmp.fetchr:init/sort_structures structures[0]
data remove storage tmp.fetchr:init/sort_structures structures[0]
function fetchr:init/sort_structures/exec