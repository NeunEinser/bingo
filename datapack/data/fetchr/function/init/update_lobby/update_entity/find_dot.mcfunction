#> fetchr:init/update_lobby/update_entity/find_dot
#
# Removes all characters in decimal_parts.decimal until it finds a dot, leaving
# the dot and everything beyond
#
# @within
# 	function fetchr:init/update_lobby/update_entity/handle_reference
# 	function fetchr:init/update_lobby/update_entity/get_decimal
# @input storage tmp.fetchr:init/update_lobby decimal_parts.decimal
# @output storage tmp.fetchr:init/update_lobby decimal_parts.decimal

data \
	modify storage tmp.fetchr:init/update_lobby decimal_parts.decimal \
	set string storage tmp.fetchr:init/update_lobby decimal_parts.decimal 1

data \
	modify storage tmp.fetchr:init/update_lobby char \
	set string storage tmp.fetchr:init/update_lobby decimal_parts.decimal 0 1

execute \
	unless data storage tmp.fetchr:init/update_lobby { char: "." } \
	unless data storage tmp.fetchr:init/update_lobby decimal_parts{ decimal: "" } \
	run function fetchr:init/update_lobby/update_entity/find_dot