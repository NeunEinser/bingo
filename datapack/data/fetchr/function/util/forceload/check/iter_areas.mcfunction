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
# The remaining z range to check
#
# @within
# 	function fetchr:util/forceload/check/iter_areas
# 	function fetchr:util/forceload/check/iter_z
#declare score_holder $util/forceload.z
execute \
	store result score $util/forceload.z fetchr.tmp \
	run data get storage tmp.fetchr:util forceload_queue_copy[-1].forceload_coordinates[-1].end_z
#>
# Tmp start z
#
# @private
#declare score_holder $util/forceload.start_z
execute \
	store result score $util/forceload.start_z fetchr.tmp \
	run data get storage tmp.fetchr:util forceload_queue_copy[-1].forceload_coordinates[-1].start_z
scoreboard players operation $util/forceload.z fetchr.tmp -= $util/forceload.start_z fetchr.tmp
#>
# The total x range to check
#
# @within
# 	function fetchr:util/forceload/check/iter_areas
# 	function fetchr:util/forceload/check/iter_z
#declare score_holder $util/forceload.total_x
execute \
	store result score $util/forceload.total_x fetchr.tmp \
	run data get storage tmp.fetchr:util forceload_queue_copy[-1].forceload_coordinates[-1].end_x
#>
# Tmp start x
#
# @private
#declare score_holder $util/forceload.start_x
execute \
	store result score $util/forceload.start_x fetchr.tmp \
	run data get storage tmp.fetchr:util forceload_queue_copy[-1].forceload_coordinates[-1].start_x
scoreboard players operation $util/forceload.total_x fetchr.tmp -= $util/forceload.start_x fetchr.tmp
$execute \
	positioned $(start_x) 0 $(start_z) \
	run function fetchr:util/forceload/check/iter_z

data remove storage tmp.fetchr:util forceload_queue_copy[-1].forceload_coordinates[-1]
execute \
	if data storage tmp.fetchr:util forceload_queue_copy[-1].forceload_coordinates[0] \
	run function fetchr:util/forceload/check/iter_areas \
		with storage tmp.fetchr:util forceload_queue_copy[-1].forceload_coordinates[-1]