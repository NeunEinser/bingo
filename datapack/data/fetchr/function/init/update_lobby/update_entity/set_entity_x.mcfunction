#> fetchr:init/update_lobby/update_entity/set_entity_x
#
# Sets the entity x coordinate to the given double parts
#
# @within
# 	function fetchr:init/update_lobby/update_entity/handle_reference
# @output tmp.fetchr:init/update_lobby update_entity.entity_x
# @params
# 	integer: int The integer part of the double. Yes this is safe as we only deal
# 		with coordinates here, so we will never have a higher number than 30000000.
# 	decimal: string The decimal part including the initial period.

$data modify storage tmp.fetchr:init/update_lobby update_entity.entity_x set value $(integer)$(decimal)d