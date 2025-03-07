#> fetchr:init/setup_lobby/schedule_lobby
#
# This function places relevant structures in the lobby.
#
# @within function fetchr:init/init
# @within function fetchr:init/setup_lobby/end

data remove storage tmp.fetchr:init/structures continue_with

execute \
	in fetchr:lobby \
	positioned 0 0 0 \
	run function fetchr:init/setup_lobby/setup { type: "lobby" }