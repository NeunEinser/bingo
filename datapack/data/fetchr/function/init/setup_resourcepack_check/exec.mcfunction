#> fetchr:init/setup_resourcepack_check/exec
#
# Waits for the resourcepack check dimension to be loaded and then spawns the
# room
#
# @within
# 	function fetchr:init/init
# 	function fetchr:init/setup_resourcepack_check/exec

execute \
	in fetchr:resourcepack_check \
	if loaded 0 0 0 \
	run function fetchr:init/setup_resourcepack_check/create


execute \
	in fetchr:resourcepack_check \
	unless loaded 0 0 0 \
	run schedule function fetchr:init/setup_resourcepack_check/exec 1t