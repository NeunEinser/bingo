#> fetchr:init/items/set_item_command_argument/from_components/iter
#
# Creates item component string from item data
#
# @within
# 	function function fetchr:init/items/set_item_command_argument/from_components
# 	function function fetchr:init/items/set_item_command_argument/from_components_iter

data \
	modify block 7 0 7 front_text.messages[0] \
	set value '{"storage": "tmp.fetchr:init", "nbt": "components"}'

data modify storage tmp.fetchr:init inner_snbt.snbt set from block 7 0 7 front_text.messages[0]
execute \
	if data storage tmp.fetchr:init inner_snbt{snbt: '"{}"'} \
	run return 0

function fetchr:util/string/parse_snbt with storage tmp.fetchr:init inner_snbt

data modify storage io.fetchr:util string set string storage io.fetchr:util nbt 2
function fetchr:util/string/until_quote

data modify storage tmp.fetchr:init char set string storage io.fetchr:util string 0 1
data modify storage tmp.fetchr:init component.name set from storage io.fetchr:util string

execute \
	unless data storage tmp.fetchr:init {test_string: ""} \
	run function fetchr:init/items/set_item_command_argument/from_components/prepend_comma

execute \
	unless data storage tmp.fetchr:init {char: "!"} \
	run function fetchr:init/items/set_item_command_argument/from_components/append_snbt \
		with storage tmp.fetchr:init component

function fetchr:init/items/set_item_command_argument/from_components/remove_component \
	with storage tmp.fetchr:init component

data modify storage io.fetchr:util concat_strings.first set from storage tmp.fetchr:init test_string
data modify storage io.fetchr:util concat_strings.second set from storage io.fetchr:util string
function fetchr:util/string/concat
data modify storage tmp.fetchr:init test_string set from storage io.fetchr:util string

function fetchr:init/items/set_item_command_argument/from_components/iter
