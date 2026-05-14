#> fetchr:init/update_lobby/end
#
# Called after the lobby is fully updated to clean things up
#
# @within
#	function fetchr:init/update_lobby/move_clone

data \
	modify storage fetchr:structure structures \
	set from storage tmp.fetchr:init/update_lobby new_structures

# This will place all required entities and spawn a new reference
execute \
	positioned 7 3 7 \
	run function fetchr:init/setup_lobby/end