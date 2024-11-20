#> fetchr:util/item_nbt_to_command_argument/append_item_tests
#
# Prepends a `[` to the current tmp.fetchr:util items[-1].command_argument.
#
# @within
# 	function fetchr:util/item_nbt_to_command_argument/**
# @input tmp.fetchr:util items[-1].command_argument
# @output tmp.fetchr:util items[-1].command_argument

data modify storage io.fetchr:util concat_strings.first set from storage io.fetchr:util command_argument
data modify storage io.fetchr:util concat_strings.second set value "["
function fetchr:util/string/concat_escaped with storage io.fetchr:util concat_strings

data modify storage io.fetchr:util concat_strings.first set from storage io.fetchr:util string
data modify storage io.fetchr:util concat_strings.second set from storage tmp.fetchr:util test_string
function fetchr:util/string/concat

data modify storage io.fetchr:util concat_strings.first set from storage io.fetchr:util string
data modify storage io.fetchr:util concat_strings.second set value "]"
function fetchr:util/string/concat

data modify storage io.fetchr:util command_argument set from storage io.fetchr:util string