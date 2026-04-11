#> fetchr:init/update_lobby/update_entity/get_decimal
#
# Sets the decimal part of the given double
#
# @within
# 	function fetchr:init/update_lobby/update_entity/handle_reference
# @params value: double The value to store the decimal part of.
# @output storage tmp.fetchr:init/update_lobby decimal_parts.decimal

$data \
	modify storage tmp.fetchr:init/update_lobby decimal_parts.decimal \
	set value "$(value)"
function fetchr:init/update_lobby/update_entity/find_dot