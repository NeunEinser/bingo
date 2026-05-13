#> fetchr:init/sort_structures/insert
#
# Inserts the structure at the current location
#
# @within fetchr:init/sort_structures/exec

data \
	modify storage fetchr:registries structures \
	append from storage tmp.fetchr:init/sort_structures structures[0]
data \
	modify storage fetchr:registries structures \
	append from storage tmp.fetchr:init/sort_structures skipped[]
data remove storage tmp.fetchr:init/sort_structures structures[0]
data modify storage tmp.fetchr:init/sort_structures skipped set value []

execute \
	if data storage tmp.fetchr:init/sort_structures structures[0] \
	run function fetchr:init/sort_structures/exec