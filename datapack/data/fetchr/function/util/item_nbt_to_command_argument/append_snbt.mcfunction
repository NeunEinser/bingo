#> fetchr:util/item_nbt_to_command_argument/append_snbt
#
# Appends the snbt representation of the given component name.
#
# @within
# 	function fetchr:util/item_nbt_to_command_argument/*
# @params name: string
# @input io.fetchr:util string
# @output io.fetchr:util string

data modify storage io.fetchr:util concat_strings.first set from storage io.fetchr:util string
data modify storage io.fetchr:util concat_strings.second set value "="
function fetchr:util/string/concat_escaped with storage io.fetchr:util concat_strings

data modify storage io.fetchr:util concat_strings.first set from storage io.fetchr:util string
$data modify storage io.fetchr:util concat_strings.second set from storage tmp.fetchr:util components.$(name)
function fetchr:util/string/concat
