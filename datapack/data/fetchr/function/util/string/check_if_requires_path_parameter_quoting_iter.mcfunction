#> fetchr:util/string/check_if_requires_path_parameter_quoting_iter
#
# Iterates over the string and checks if there are characters that require
# a path argument to be quoted.
#
# @within
# 	function fetchr:util/string/check_if_requires_path_parameter_quoting
# 	function fetchr:util/string/check_if_requires_path_parameter_quoting_iter
# @input storage tmp.fetchr:util string
# @outputs
# 	scoreboard $util/string.requires_path_parameter_quoting fetchr.io

data \
	modify storage tmp.fetchr:util char \
	set string storage tmp.fetchr:util string 0 1

execute \
	if data storage tmp.fetchr:util {char: "'"} \
	run scoreboard players set $util/string.requires_path_parameter_quoting fetchr.io 1
execute \
	if data storage tmp.fetchr:util {char: '"'} \
	run scoreboard players set $util/string.requires_path_parameter_quoting fetchr.io 1
execute \
	if data storage tmp.fetchr:util {char: "."} \
	run scoreboard players set $util/string.requires_path_parameter_quoting fetchr.io 1
execute \
	if data storage tmp.fetchr:util {char: " "} \
	run scoreboard players set $util/string.requires_path_parameter_quoting fetchr.io 1

execute \
	if score $util/string.requires_path_parameter_quoting fetchr.io matches 1 \
	run return 0

data \
	modify storage tmp.fetchr:util string \
	set string storage tmp.fetchr:util string 1

execute \
	unless data storage tmp.fetchr:util {string:""} \
	run function fetchr:util/string/check_if_requires_path_parameter_quoting_iter