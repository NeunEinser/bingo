#> fetchr:util/forceload/check/queue_iter
#
# Iterates the queue and checks if the requested chunks by an entry are loaded
#
# @within
# 	function fetchr:util/forceload/check/schedule
# 	function fetchr:util/forceload/check/queue_iter
# @param callback: #[id=function] string

scoreboard players set $util/forceload.is_loaded fetchr.tmp 1
function fetchr:util/forceload/check/iter_areas \
	with storage tmp.fetchr:util forceload_queue_copy[-1].forceload_coordinates[-1]

execute \
	if score $util/forceload.is_loaded fetchr.tmp matches 0 \
	run data \
		modify storage tmp.fetchr:util forceload_queue \
		append from storage tmp.fetchr:util forceload_queue_copy[-1]

$execute \
	if score $util/forceload.is_loaded fetchr.tmp matches 1 \
	run function $(callback)

data remove storage tmp.fetchr:util forceload_queue_copy[-1]
execute \
	if data storage tmp.fetchr:util forceload_queue_copy[0] \
	run function fetchr:util/forceload/check/queue_iter \
		with storage tmp.fetchr:util forceload_queue_copy[-1]