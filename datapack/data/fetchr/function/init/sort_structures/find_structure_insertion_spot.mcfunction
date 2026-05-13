#> fetchr:init/sort_structures/find_structure_insertion_spot
#
# Inserts the structure, knowing it exists in the current list
#
# @within fetchr:init/sort_structures/append_after

data \
	modify storage tmp.fetchr:init/sort_structures id_comparision \
	set from storage fetchr:registries structures[-1].id
execute \
	store success score $init/structure.is_different fetchr.tmp \
	run data \
		modify storage tmp.fetchr:init/sort_structures id_comparision \
		set from storage tmp.fetchr:init/sort_structures structures[0].after_structure
execute \
	if score $init/structure.is_different fetchr.tmp matches 0 \
	run return run function fetchr:init/sort_structures/insert

data \
	modify storage tmp.fetchr:init/sort_structures id_comparision \
	set from storage fetchr:registries structures[-1].after_structure
execute \
	if data storage fetchr:registries structures[-1].after_structure \
	store success score $init/structure.is_different fetchr.tmp \
	run data \
		modify storage tmp.fetchr:init/sort_structures id_comparision \
		set from storage tmp.fetchr:init/sort_structures structures[0].after_structure
execute \
	if score $init/structure.is_different fetchr.tmp matches 0 \
	run return run function fetchr:init/sort_structures/insert

data \
	modify storage tmp.fetchr:init/sort_structures skipped \
	prepend from storage fetchr:registries structures[-1]
data remove storage fetchr:registries structures[-1]
function fetchr:init/sort_structures/find_structure_insertion_spot