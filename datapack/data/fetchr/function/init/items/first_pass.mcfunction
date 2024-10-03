#> fetchr:init/items/first_pass
#
# Initializes and normalizes items and item categories. Calculates total item
# weight for each category.
#
# @within
# 	function fetchr:init/items/lobby_loaded
# 	function fetchr:init/items/first_pass
# @writes storage fetchr:items categories

data modify storage tmp.fetchr:init itemCategories set from storage tmp.fetchr:init items[-1].categories
data remove storage tmp.fetchr:init items[-1].categories[]
function fetchr:init/items/normalize_categories
data remove storage tmp.fetchr:init items[-1].weight

data modify storage tmp.fetchr:init itemCategories set from storage tmp.fetchr:init items[-1].categories
function fetchr:init/items/find_categories
data modify storage fetchr:items categories append from storage tmp.fetchr:init skippedCategories[]
data remove storage tmp.fetchr:init skippedCategories

setblock 0 15 0 minecraft:oak_sign{front_text:{messages:['{"storage": "tmp.fetchr:init", "nbt": "items[-1].textComponent", "interpret": true, "italic": false}', '""', '""', '""']}}

data modify storage tmp.fetchr:init items[-1].item.components.minecraft:custom_name set from block 0 15 0 front_text.messages[0]
setblock 0 15 0 minecraft:air

function fetchr:init/items/update_category_total_weight
data remove storage tmp.fetchr:init categories

data modify storage tmp.fetchr:init initializedItems append from storage tmp.fetchr:init items[-1]
data remove storage tmp.fetchr:init items[-1]

execute if data storage tmp.fetchr:init items[0] run function fetchr:init/items/first_pass
