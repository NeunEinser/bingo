#> fetchr:util/forceload/check/schedule
#
# Scheduleable function to check whether the forceload queue is loaded
#
# @within
# 	function fetchr:util/forceload_and_wait
# 	function fetchr:util/check/schedule

data \
	modify storage tmp.fetchr:util forceload_queue_copy \
	set from storage tmp.fetchr:util forceload_queue
data modify storage tmp.fetchr:util forceload_queue set value []

function fetchr:util/forceload/check/queue_iter with storage tmp.fetchr:util forceload_queue_copy[-1]

execute \
	if data storage tmp.fetchr:util forceload_queue[0] \
	run schedule function fetchr:util/forceload/check/schedule 1t