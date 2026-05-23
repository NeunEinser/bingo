#> fetchr:init/update_lobby/end
#
# Called after the lobby is fully updated to clean things up
#
# @within
#	function fetchr:init/update_lobby/move_clone

execute \
	in fetchr:lobby \
	as @a \
	run function fetchr:util/check_lobby_upgrade_and_show_error_message

data \
	modify storage fetchr:structure structures \
	set from storage tmp.fetchr:init/update_lobby new_structures

gamerule spawnRadius 10
# This will place all required entities and spawn a new reference
execute \
	positioned 7 3 7 \
	run function fetchr:init/setup_lobby/end

execute \
	as @a[predicate=fetchr:is_in_game] \
	run function fetchr:util/go_to_lobby