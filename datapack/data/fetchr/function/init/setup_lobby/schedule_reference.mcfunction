#> fetchr:init/setup_lobby/schedule_reference
#
# This function places relevant structures in the lobby reference.
#
# @within function fetchr:init/init
execute \
	in fetchr:lobby \
	positioned 1000000 0 0 \
	run function fetchr:init/setup_lobby/setup { type: "reference" }