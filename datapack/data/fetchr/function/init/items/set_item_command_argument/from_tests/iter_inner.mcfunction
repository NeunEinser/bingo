#> fetchr:init/items/set_item_command_argument/from_tests/iter
#
# Creates item component string from item data
#
# @within
# 	function function fetchr:init/items/set_item_command_argument/from_tests
# 	function function fetchr:init/items/set_item_command_argument/from_tests_iter
# @params string: string

data modify storage io.fetchr:util string set from storage tmp.fetchr:init inner_tests[-1].id
data modify storage tmp.fetchr:init test_type set from storage tmp.fetchr:init inner_tests[-1].type

execute \
	if data storage tmp.fetchr:init { test_type: "fetchr:negated_component" } \
	run function fetchr:init/items/set_item_command_argument/from_tests/prepend_exclamation

execute \
	unless data storage tmp.fetchr:init { inner_test_string: "" } \
	run function fetchr:init/items/set_item_command_argument/from_tests/prepend_pipe

execute \
	if data storage tmp.fetchr:init { test_type: "fetchr:component" } \
	run function fetchr:init/items/set_item_command_argument/from_tests/append_component_snbt
execute \
	if data storage tmp.fetchr:init { test_type: "fetchr:predicate" } \
	run function fetchr:init/items/set_item_command_argument/from_tests/append_predicate_snbt

data modify storage io.fetchr:util concat_strings.first set from storage tmp.fetchr:init inner_test_string
data modify storage io.fetchr:util concat_strings.second set from storage io.fetchr:util string
function fetchr:util/string/concat
data modify storage tmp.fetchr:init inner_test_string set from storage io.fetchr:util string

data remove storage tmp.fetchr:init inner_tests[-1]
execute \
	if data storage tmp.fetchr:init inner_tests[0] \
	run function fetchr:init/items/set_item_command_argument/from_tests/iter_inner
