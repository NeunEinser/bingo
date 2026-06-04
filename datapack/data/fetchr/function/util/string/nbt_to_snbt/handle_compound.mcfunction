#> fetchr:util/string/nbt_to_snbt/handle_compound
#
# Appends the current compound text component to io.fetchr string
#
# @within function fetchr:util/string/nbt_to_snbt
# @context dimension fetchr:lobby

data \
	modify storage io.fetchr:util concat_strings.first \
	set from storage io.fetchr:util string
data modify storage io.fetchr:util concat_strings.second set value ""
data \
	modify storage io.fetchr:util concat_strings.second \
	set from storage tmp.fetchr:util text_component.text
function fetchr:util/string/concat

execute \
	if data storage tmp.fetchr:util text_component.extra[0] \
	run data \
		modify storage tmp.fetchr:util snbt_stack \
		append from storage tmp.fetchr:util text_component.extra

execute \
	if data storage tmp.fetchr:util text_component.extra[0] \
	run function fetchr:util/string/nbt_to_snbt/handle_list

data remove storage tmp.fetchr:util snbt_stack[-1]