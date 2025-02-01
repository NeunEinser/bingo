#> fetchr:util/item_nbt_to_command_argument/iter_components
#
# Creates item component string from item data
#
# @within
# 	function function fetchr:util/item_nbt_to_command_argument
# 	function function fetchr:util/item_nbt_to_command_argument_iter

#NEUN_SCRIPT until 65
#data \
	modify block 7 0 7 front_text.messages[0] \
	set value '{ "storage": "tmp.fetchr:util", "nbt": "components" }'
#data modify storage tmp.fetchr:util inner_snbt.snbt set from block 7 0 7 front_text.messages[0]
#execute \
	if data storage tmp.fetchr:util inner_snbt{ snbt: '"{}"' } \
	run return 0
#function fetchr:util/string/parse_snbt with storage tmp.fetchr:util inner_snbt

#data modify storage io.fetchr:util string set string storage io.fetchr:util nbt 2
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data \
	modify block 7 0 7 front_text.messages[0] \
	set value { storage: "tmp.fetchr:util", nbt: "components" }
data modify storage tmp.fetchr:util snbt set from block 7 0 7 front_text.messages[0]
execute \
	if data storage tmp.fetchr:util snbt."" \
	run data \
		modify storage tmp.fetchr:util snbt \
		set from storage tmp.fetchr:util snbt.""
execute \
	if data storage tmp.fetchr:util { snbt: "{}" } \
	run return 0

data modify storage io.fetchr:util string set string storage tmp.fetchr:util snbt 2
#NEUN_SCRIPT end

function fetchr:util/string/until_quote

data modify storage tmp.fetchr:util char set string storage io.fetchr:util string 0 1
data modify storage tmp.fetchr:util component.name set from storage io.fetchr:util string

execute \
	unless data storage tmp.fetchr:util { test_string: "" } \
	run function fetchr:util/item_nbt_to_command_argument/prepend_comma

execute \
	unless data storage tmp.fetchr:util { char: "!" } \
	run function fetchr:util/item_nbt_to_command_argument/append_snbt \
		with storage tmp.fetchr:util component

function fetchr:util/item_nbt_to_command_argument/remove_component \
	with storage tmp.fetchr:util component

data modify storage io.fetchr:util concat_strings.first set from storage tmp.fetchr:util test_string
data modify storage io.fetchr:util concat_strings.second set from storage io.fetchr:util string
function fetchr:util/string/concat
data modify storage tmp.fetchr:util test_string set from storage io.fetchr:util string

function fetchr:util/item_nbt_to_command_argument/iter_components
