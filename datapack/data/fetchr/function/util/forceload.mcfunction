#> fetchr:util/forceload
#
# Forceloads a specified area
#
# @public
# @params
# 	dimension: #[id=dimension] string,
# 	start_x: int @ -30000000..29999999,
# 	start_z: int @ -30000000..29999999,
# 	negative_x: int @ -30000000..0,
# 	positive_x: int @ 0..29999999,
# 	negative_z: int @ -30000000..0,
# 	positive_z: int @ 0..29999999,

$execute \
	in $(dimension) \
	positioned $(start_x) 0 $(start_x) \
	run forceload add ~$(negative_x) ~$(negative_z) ~$(positive_x) ~$(positive_z)