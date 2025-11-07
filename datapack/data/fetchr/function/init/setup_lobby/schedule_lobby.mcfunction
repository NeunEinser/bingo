#> fetchr:init/setup_lobby/schedule_lobby
#
# This function places relevant structures in the lobby.
#
# @within function fetchr:init/init
# @within function fetchr:init/setup_lobby/end

scoreboard players set $init/lobby.is_reference fetchr.tmp 0
data modify storage fetchr:structure structures set value []

execute \
	in fetchr:lobby \
	positioned 0 0 7 \
	run function fetchr:init/setup_lobby/setup { type: "lobby" }