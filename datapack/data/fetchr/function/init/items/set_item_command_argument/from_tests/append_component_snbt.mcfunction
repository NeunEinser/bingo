#> fetchr:init/items/set_item_command_argument/from_components/append_snbt
#
# Appends the snbt representation of the given component name.
#
# @within
# 	function fetchr:init/items/set_item_command_argument/from_components/*
# @params name: string
# @input io.fetchr:util string
# @output io.fetchr:util string

data modify storage io.fetchr:util concat_strings.first set from storage io.fetchr:util string
data modify storage io.fetchr:util concat_strings.second set value "="
function fetchr:util/string/concat_escaped with storage io.fetchr:util concat_strings

data modify storage io.fetchr:util concat_strings.first set from storage io.fetchr:util string
data modify storage io.fetchr:util concat_strings.second set from storage tmp.fetchr:init inner_tests[-1].component
function fetchr:util/string/concat
