#> fetchr:init/setup_lobby/root
#
# This function places relevant structures in the lobby.
#
# @within function fetchr:init/init
execute \
	in fetchr:lobby \
	run forceload add 14 7 15 -17
execute \
	in fetchr:lobby \
	if loaded 14 1 7 \
	if loaded 15 3 -17 \
	run function fetchr:init/setup_lobby/start

execute \
	in fetchr:lobby \
	unless loaded 14 1 7 \
	run schedule function fetchr:init/setup_lobby/root 1t
execute \
	in fetchr:lobby \
	unless loaded 15 3 -17 \
	run schedule function fetchr:init/setup_lobby/root 1t