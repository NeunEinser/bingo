#> fetchr:util/forceload/check/iter_areas
#
# Iterates the current queue entry's positions and checks if they are loaded
#
# @within
# 	function fetchr:util/forceload/check/queue_iter
# 	function fetchr:util/forceload/check/iter_areas
# @params
# 	dimension: #[id=dimension] string,
# 	start_x: int @ -30000000..29999999,
# 	start_z: int @ -30000000..29999999,

#>
# The current z coordinate
#
# @within
# 	function fetchr:util/forceload/check/iter_areas
# 	function fetchr:util/forceload/check/iter_z
#declare score_holder $util/forceload.z
execute \
	store result score $util/forceload.z fetchr.tmp \
	run data get storage tmp.fetchr:util forceload_queue_copy[-1].forceload_coordinates[-1].start_z
#>
# The target z coordinate
#
# @within
# 	function fetchr:util/forceload/check/iter_areas
# 	function fetchr:util/forceload/check/iter_z
#declare score_holder $util/forceload.target_z
execute \
	store result score $util/forceload.target_z fetchr.tmp \
	run data get storage tmp.fetchr:util forceload_queue_copy[-1].forceload_coordinates[-1].end_z
scoreboard players operation $util/forceload.target_z fetchr.tmp /= 16 fetchr.const
scoreboard players operation $util/forceload.target_z fetchr.tmp *= 16 fetchr.const
scoreboard players add $util/forceload.target_z fetchr.tmp 15
#>
# The target x coordinate
#
# @within
# 	function fetchr:util/forceload/check/iter_areas
# 	function fetchr:util/forceload/check/iter_x
#declare score_holder $util/forceload.target_x
execute \
	store result score $util/forceload.target_x fetchr.tmp \
	run data get storage tmp.fetchr:util forceload_queue_copy[-1].forceload_coordinates[-1].end_x
scoreboard players operation $util/forceload.target_x fetchr.tmp /= 16 fetchr.const
scoreboard players operation $util/forceload.target_x fetchr.tmp *= 16 fetchr.const
scoreboard players add $util/forceload.target_x fetchr.tmp 15

$execute \
	in $(dimension) \
	positioned $(start_x) 0 $(start_z) \
	run function fetchr:util/forceload/check/iter_z

execute \
	if score $util/forceload.is_loaded fetchr.tmp matches 1 \
	run data remove storage tmp.fetchr:util forceload_queue_copy[-1].forceload_coordinates[-1]
execute \
	if score $util/forceload.is_loaded fetchr.tmp matches 1 \
	if data storage tmp.fetchr:util forceload_queue_copy[-1].forceload_coordinates[0] \
	run function fetchr:util/forceload/check/iter_areas \
		with storage tmp.fetchr:util forceload_queue_copy[-1].forceload_coordinates[-1]