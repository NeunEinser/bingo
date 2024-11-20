#> fetchr:init/items/set_item_command_argument/from_components/exec
#
# Creates item component string from item data
#
# @within
# 	function fetchr:init/items/first_pass

data \
	modify storage io.fetchr:util item \
	set from storage tmp.fetchr:init items[-1].item
function fetchr:util/item_nbt_to_command_argument/exec
data \
	modify storage tmp.fetchr:init items[-1].command_argument \
	set from storage io.fetchr:util command_argument