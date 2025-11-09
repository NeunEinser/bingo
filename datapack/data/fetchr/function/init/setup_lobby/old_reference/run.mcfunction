#> fetchr:init/setup_lobby/setup_lobby/old_reference/run
#
# The entry point to set the correct old structures for reference creation
#
# @within
# 	function fetchr:init/setup_lobby/setup_reference
# 	function fetchr:init/setup_lobby/forceload

execute \
	in fetchr:lobby \
	run function fetchr:init/setup_lobby/old_reference/forceload