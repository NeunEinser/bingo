#> fetchr:util/forceload/forceload_iter
#
# Iterates over the list of chunks to forceload and forceloads them
#
# @within
# 	function fetchr:util/forceload_and_wait
# 	function fetchr:util/forceload/forceload_iter

function fetchr:util/forceload with storage tmp.fetchr:util forceload_coordinates[-1]

data remove storage tmp.fetchr:util forceload_coordinates[-1]
execute \
	if data storage tmp.fetchr:util forceload_coordinates[0] \
	run function fetchr:util/forceload/forceload_iter