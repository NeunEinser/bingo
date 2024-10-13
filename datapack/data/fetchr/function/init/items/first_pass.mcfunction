#> fetchr:init/items/first_pass
#
# Initializes and normalizes items and item categories. Calculates total item
# weight for each category.
#
# @within
# 	function fetchr:init/items/lobby_loaded
# 	function fetchr:init/items/first_pass
# @writes storage fetchr:items categories
# @params ::fetchr::storages::registry::ItemRegistryData

data modify storage tmp.fetchr:init item_categories set from storage tmp.fetchr:init items[-1].categories
data remove storage tmp.fetchr:init items[-1].categories[]
function fetchr:init/items/normalize_categories

data modify storage tmp.fetchr:init item_categories set from storage tmp.fetchr:init items[-1].categories
function fetchr:init/items/update_category_total_weight with storage tmp.fetchr:init item_categories[-1]

data modify storage tmp.fetchr:init items[-1].command_argument set from storage tmp.fetchr:init items[-1].item.id
execute \
	if data storage tmp.fetchr:init items[-1].item.components \
	unless data storage tmp.fetchr:init items[-1].item_tests \
	run function fetchr:init/items/set_item_command_argument/from_components/exec
execute \
	if data storage tmp.fetchr:init items[-1].item_tests \
	run function fetchr:init/items/set_item_command_argument/from_tests/exec

$data modify storage tmp.fetchr:init items[-1].item.components.minecraft:custom_name set value '{"translate": "$(translation)", "italic": false}'
data remove storage tmp.fetchr:init items[-1].weight

data modify storage tmp.fetchr:init initialized_items append from storage tmp.fetchr:init items[-1]
data remove storage tmp.fetchr:init items[-1]

execute if data storage tmp.fetchr:init items[0] run function fetchr:init/items/first_pass with storage tmp.fetchr:init items[-1]
