#> fetchr:init/setup_lobby/schedule_reference
#
# This function places relevant structures in the lobby reference.
#
# @within function fetchr:init/init

data remove storage tmp.fetchr:init/structures continue_with
scoreboard players set $init/lobby.is_reference fetchr.tmp 1
data \
	modify storage tmp.fetchr:init/structures structures \
	set from storage fetchr:structure structures

execute \
	in fetchr:lobby \
	positioned 29999984 0 29999744 \
	run function fetchr:init/setup_lobby/setup { type: "reference" }