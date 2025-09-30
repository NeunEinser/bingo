#> fetchr:util/item_nbt_to_command_argument/prepend_comma
#
# Prepends a comma to the current io.fetchr:util string.
#
# @within
# 	function fetchr:util/item_nbt_to_command_argument/**
# @input io.fetchr:util string
# @output io.fetchr:util string

data modify storage io.fetchr:util concat_strings.first set value ","
data modify storage io.fetchr:util concat_strings.second set from storage io.fetchr:util string
function fetchr:util/string/concat_escaped with storage io.fetchr:util concat_strings