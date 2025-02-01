#> fetchr:init/items/set_item_command_argument/from_components/prepend_comma
#
# Prepends a comma to the current io.fetchr:util string.
#
# @within
# 	function fetchr:init/items/set_item_command_argument/**
# @input io.fetchr:util string
# @output io.fetchr:util string

data modify storage io.fetchr:util concat_strings.first set value ", "
data \
	modify storage io.fetchr:util concat_strings.second \
	set from storage tmp.fetchr:init inner_test_string
function fetchr:util/string/concat

data modify storage tmp.fetchr:init inner_test_string set from storage io.fetchr:util string