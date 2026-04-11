#> fetchr:init/update_lobby/update_entity/handle_old
#
# Handles the old entity that was found
#
# @within
# 	function fetchr:init/update_lobby/update_entity/handle_reference
# @context
# 	entity The old entity

tag @s add fetchr.current_old
data modify storage tmp.fetchr:init/update_lobby old_entity set from entity @s

return 1