#> fetchr:init/update_lobby/end
#
# Called after the lobby is fully updated to clean things up
#
# @within
#	function fetchr:init/update_lobby/move_clone

data \
	modify storage fetchr:structure structures \
	set from storage tmp.fetchr:init/update_lobby new_structures

execute \
	if entity @a[predicate=fetchr:is_in_lobby] \
	run function fetchr:lobby/place_indestructible_blocks

# This will place all required entities and spawn a new reference
function fetchr:init/setup_lobby/end