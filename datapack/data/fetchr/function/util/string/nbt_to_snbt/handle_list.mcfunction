#> fetchr:util/string/nbt_to_snbt/handle_list
#
# Appends the current list text component to io.fetchr string
#
# @within function fetchr:util/string/nbt_to_snbt
# @context dimension fetchr:lobby

data \
	modify storage tmp.fetchr:util snbt_stack \
	append from storage tmp.fetchr:util snbt_stack[-1][0]
function fetchr:util/string/nbt_to_snbt/append_text_component

data remove storage tmp.fetchr:util snbt_stack[-1][0]

execute \
	if data storage tmp.fetchr:util snbt_stack[-1][0] \
	run return run function fetchr:util/string/nbt_to_snbt/handle_list

data remove storage tmp.fetchr:util snbt_stack[-1]