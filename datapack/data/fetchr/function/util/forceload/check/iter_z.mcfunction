#> fetchr:util/forceload/check/iter_z
#
# Iterates the z coordinates and checks if all x columns of the current queue
# entry's current area are loaded
#
# @within
# 	function fetchr:util/forceload/check/iter_areas
# 	function fetchr:util/forceload/check/iter_z

#>
# The remaining x range to check
#
# @within
# 	function fetchr:util/forceload/check/iter_z
# 	function fetchr:util/forceload/check/iter_x
#declare score_holder $util/forceload.x
scoreboard players operation $util/forceload.x fetchr.tmp = $util/forceload.total_x fetchr.tmp

function fetchr:util/forceload/check/iter_x
scoreboard players remove $util/forceload.z fetchr.tmp 16

execute \
	if score $util/forceload.z fetchr.tmp matches 0.. \
	if score $util/forceload.is_loaded fetchr.tmp matches 1 \
	positioned ~ ~ ~16 \
	run function fetchr:util/forceload/check/iter_z