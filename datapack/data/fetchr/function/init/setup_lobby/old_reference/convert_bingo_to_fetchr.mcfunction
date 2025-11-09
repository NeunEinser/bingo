#> fetchr:init/setup_lobby/setup_lobby/old_reference/set_old_structures
#
# Converts the namespace of the current structure from bingo to fetchr
#
# @within function fetchr:init/setup_lobby/old_reference/set_old_structures

data modify storage tmp.fetchr:init/structures name.first set value "fetchr:"

data \
	modify storage tmp.fetchr:init/structures name.second \
	set string storage tmp.fetchr:init/structures legacy_bingo_structures[0] 6

function fetchr:util/string/concat_escaped with storage tmp.fetchr:init/structures name

data \
	modify storage tmp.fetchr:init/structures legacy_structures \
	append from storage io.fetchr:util string