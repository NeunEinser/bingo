#> fetchr:init/sort_structures/exec
#
# Sorts the structures according to their `after_structure` entry.
#
# @within fetchr:init/init

execute \
	unless data storage tmp.fetchr:init/sort_structures structures[0].after_structure \
	run return run function fetchr:init/sort_structures/insert

function fetchr:init/sort_structures/insert_after \
	with storage tmp.fetchr:init/sort_structures structures[0]