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

#NEUN_SCRIPT until 33
#data modify storage tmp.fetchr:init items[-1].item.Count set value 1b
#NEUN_SCRIPT end

setblock 0 15 0 minecraft:oak_sign{front_text:{messages:['{"storage": "tmp.fetchr:init", "nbt": "items[-1].textComponent", "interpret": true, "italic": false}', '""', '""', '""']}}

#NEUN_SCRIPT until 33
#data modify storage tmp.fetchr:init items[-1].item.tag.display.Name set from block 0 15 0 front_text.messages[0]
#NEUN_SCRIPT end
#NEUN_SCRIPT since 33
data modify storage tmp.fetchr:init items[-1].item.components.minecraft:custom_name set from block 0 15 0 front_text.messages[0]
#NEUN_SCRIPT end
setblock 0 15 0 minecraft:air

function fetchr:init/items/update_category_total_weight
data remove storage tmp.fetchr:init categories

data modify storage tmp.fetchr:init initializedItems append from storage tmp.fetchr:init items[-1]
data remove storage tmp.fetchr:init items[-1]

execute if data storage tmp.fetchr:init items[0] run function fetchr:init/items/first_pass
