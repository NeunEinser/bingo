#> fetchr:init/items/set_item_command_argument/from_components/exec
#
# Creates item component string from item data
#
# @within
# 	function fetchr:init/items/first_pass

data modify storage tmp.fetchr:init components set from storage tmp.fetchr:init items[-1].item.components

data modify storage tmp.fetchr:init test_string set value ""
function fetchr:init/items/set_item_command_argument/from_components/iter

execute \
	unless data storage tmp.fetchr:init {test_string: ""} \
	run function fetchr:init/items/set_item_command_argument/append_item_tests