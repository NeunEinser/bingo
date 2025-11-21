#> fetchr:util/forceload
#
# Forceloads a specified area
#
# @public
# @params
# 	dimension: #[id=dimension] string
# 	start_x: int @ -30000000..29999999
# 	start_z: int @ -30000000..29999999
# 	end_x: int @ -30000000..29999999
# 	end_z: int @ -30000000..29999999

$execute \
	in $(dimension) \
	run forceload add $(start_x) $(start_z) $(end_x) $(end_z)