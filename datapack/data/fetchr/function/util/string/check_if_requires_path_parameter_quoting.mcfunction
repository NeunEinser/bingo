#> fetchr:util/string/check_if_requires_path_parameter_quoting
#
# Checks if the given string requires surrounding quotes if used as a path
# parameter
#
# @public
# @input storage io.fetchr:util string
# @outputs
# 	scoreboard $util/string.requires_path_parameter_quoting fetchr.io

scoreboard players set $util/string.requires_path_parameter_quoting fetchr.io 0
data \
	modify storage tmp.fetchr:util string \
	set from storage io.fetchr:util string
function fetchr:util/string/check_if_requires_path_parameter_quoting_iter