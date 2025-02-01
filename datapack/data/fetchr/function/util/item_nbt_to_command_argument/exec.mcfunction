#> fetchr:util/item_nbt_to_command_argument/exec
#
# Turns an item into a command argument
#
# @internal

data \
	modify storage io.fetchr:util command_argument \
	set from storage io.fetchr:util item.id

data \
	modify storage tmp.fetchr:util components \
	set from storage io.fetchr:util item.components

data modify storage tmp.fetchr:util test_string set value ""
execute \
	if data storage io.fetchr:util item.components \
	run function fetchr:util/item_nbt_to_command_argument/iter_components

execute \
	unless data storage tmp.fetchr:util { test_string: "" } \
	run function fetchr:util/item_nbt_to_command_argument/append_item_tests