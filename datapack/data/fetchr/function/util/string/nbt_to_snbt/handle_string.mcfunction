#> fetchr:util/string/nbt_to_snbt/handle_string
#
# Appends the current string text component to io.fetchr string
#
# @within function fetchr:util/string/nbt_to_snbt
# @context dimension fetchr:lobby

data \
	modify storage io.fetchr:util concat_strings.first \
	set from storage io.fetchr:util string
data \
	modify storage io.fetchr:util concat_strings.second \
	set from storage tmp.fetchr:util snbt_stack[-1]
function fetchr:util/string/concat