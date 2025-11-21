#> fetchr:util/forceload/check/iter_z
#
# Iterates the z coordinates and checks if all x columns of the current queue
# entry's current area are loaded
#
# @within
# 	function fetchr:util/forceload/check/iter_areas
# 	function fetchr:util/forceload/check/iter_z

#>
# The current x coordinate
#
# @within
# 	function fetchr:util/forceload/check/iter_z
# 	function fetchr:util/forceload/check/iter_x
#declare score_holder $util/forceload.x
execute \
	store result score $util/forceload.x fetchr.tmp \
	run data get storage tmp.fetchr:util forceload_queue_copy[-1].forceload_coordinates[-1].start_x
function fetchr:util/forceload/check/iter_x

scoreboard players add $util/forceload.z fetchr.tmp 16

execute \
	if score $util/forceload.z fetchr.tmp <= $util/forceload.target_z fetchr.tmp \
	if score $util/forceload.is_loaded fetchr.tmp matches 1 \
	positioned ~ ~ ~16 \
	run function fetchr:util/forceload/check/iter_z