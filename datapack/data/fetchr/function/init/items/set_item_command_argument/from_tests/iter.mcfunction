#> fetchr:init/items/set_item_command_argument/from_tests/iter
#
# Creates item component string from item data
#
# @within
# 	function function fetchr:init/items/set_item_command_argument/from_tests
# 	function function fetchr:init/items/set_item_command_argument/from_tests_iter

data modify storage tmp.fetchr:init inner_tests set value []

execute \
	if data storage tmp.fetchr:init tests[-1][0] \
	run data modify storage tmp.fetchr:init inner_tests append from storage tmp.fetchr:init tests[-1][]
execute \
	unless data storage tmp.fetchr:init tests[-1][0] \
	run data modify storage tmp.fetchr:init inner_tests append from storage tmp.fetchr:init tests[-1]

data modify storage tmp.fetchr:init inner_test_string set value ""
function fetchr:init/items/set_item_command_argument/from_tests/iter_inner

execute \
	unless data storage tmp.fetchr:init {test_string: ""} \
	run function fetchr:init/items/set_item_command_argument/from_tests/prepend_comma

data modify storage io.fetchr:util concat_strings.first set from storage tmp.fetchr:init test_string
data modify storage io.fetchr:util concat_strings.second set from storage tmp.fetchr:init inner_test_string
function fetchr:util/string/concat

data modify storage tmp.fetchr:init test_string set from storage io.fetchr:util string

data remove storage tmp.fetchr:init tests[-1]
execute \
	if data storage tmp.fetchr:init tests[0] \
	run function fetchr:init/items/set_item_command_argument/from_tests/iter