#> fetchr:init/setup_lobby/setup_lobby/old_reference/run
#
# The entry point to set the correct old structures for reference creation.
#
# This should only be used for structures spawned in a version that did not
# support lobby upgrading.
#
# @within
# 	function fetchr:init/setup_lobby/setup_reference
# 	function fetchr:init/setup_lobby/forceload

execute \
	in fetchr:lobby \
	run function fetchr:init/setup_lobby/old_reference/forceload