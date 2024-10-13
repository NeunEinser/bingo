#> fetchr:init/items/set_item_command_argument/append_open_square_bracket
#
# Prepends a `[` to the current tmp.fetchr:init items[-1].command_argument.
#
# @within
# 	function fetchr:init/items/set_item_command_argument/**
# @input tmp.fetchr:init items[-1].command_argument
# @output tmp.fetchr:init items[-1].command_argument

data modify storage io.fetchr:util concat_strings.first set from storage tmp.fetchr:init items[-1].command_argument
data modify storage io.fetchr:util concat_strings.second set value "["
function fetchr:util/string/concat_escaped with storage io.fetchr:util concat_strings

data modify storage io.fetchr:util concat_strings.first set from storage io.fetchr:util string
data modify storage io.fetchr:util concat_strings.second set from storage tmp.fetchr:init test_string
function fetchr:util/string/concat

data modify storage io.fetchr:util concat_strings.first set from storage io.fetchr:util string
data modify storage io.fetchr:util concat_strings.second set value "]"
function fetchr:util/string/concat

data modify storage tmp.fetchr:init items[-1].command_argument set from storage io.fetchr:util string