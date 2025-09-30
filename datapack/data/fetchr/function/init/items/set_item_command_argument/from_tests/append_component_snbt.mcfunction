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
#NEUN_SCRIPT until 69
#data \
	modify block 7 0 7 front_text.messages[0] \
	set value '{ "storage": "tmp.fetchr:init", "nbt": "inner_tests[-1].component" }'

#data \
	modify storage tmp.fetchr:util inner_snbt.snbt \
	set from block 7 0 7 front_text.messages[0]
#function fetchr:util/string/parse_snbt \
	with storage tmp.fetchr:util inner_snbt

#data \
	modify storage io.fetchr:util concat_strings.second \
	set from storage io.fetchr:util nbt
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
data \
	modify block 7 0 7 front_text.messages[0] \
	set value { storage: "tmp.fetchr:init", nbt: "inner_tests[-1].component" }
data modify storage io.fetchr:util concat_strings.second set from block 7 0 7 front_text.messages[0]
#NEUN_SCRIPT end
function fetchr:util/string/concat
