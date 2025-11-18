#> fetchr:util/forceload/check/iter_z
#
# Iterates the x coordinates and checks if all chunks are fully loaded
#
# @within
# 	function fetchr:util/forceload/check/iter_z
# 	function fetchr:util/forceload/check/iter_x

execute \
	unless loaded ~ ~ ~ \
	run scoreboard players set $util/forceload.is_loaded fetchr.tmp 0
scoreboard players remove $util/forceload.x fetchr.tmp 16

execute \
	if score $util/forceload.x fetchr.tmp matches 0.. \
	if score $util/forceload.is_loaded fetchr.tmp matches 1 \
	positioned ~ ~ ~16 \
	run function fetchr:util/forceload/check/iter_z