#> fetchr:init/items/add_category_info
#
# Adds the category name to the item's lore and adds full information to item
# categories
#
# @input storage tmp.fetchr:init itemCategories
# @writes storage tmp.fetchr:init items[-1].item.components.minecraft:lore
# @within
# 	function fetchr:init/items/second_pass
# 	function fetchr:init/items/add_category_info

data modify storage tmp.fetchr:init itemCategories set from storage tmp.fetchr:init itemCategoriesCopy
data modify storage tmp.fetchr:init searchedCategory set from storage tmp.fetchr:init currentCategories[-1].id
function fetchr:init/items/find_item_category

# set lore
setblock 0 15 0 minecraft:oak_sign{front_text: {messages: ['[{"text": "  • ", "color": "gray", "italic": false}, {"storage": "tmp.fetchr:init", "nbt": "currentCategories[-1].name", "interpret": true}, " (", {"storage": "tmp.fetchr:init", "nbt": "itemCategories[-1].weight"}, "/", {"storage": "tmp.fetchr:init", "nbt": "currentCategories[-1].totalItemWeight"}, ")"]', '""', '""', '""']}}
#NEUN_SCRIPT until 33
#data modify storage tmp.fetchr:init initializedItems[-1].item.tag.display.Lore append from block 0 15 0 front_text.messages[0]
#NEUN_SCRIPT end
#NEUN_SCRIPT since 33
data modify storage tmp.fetchr:init initializedItems[-1].item.components.minecraft:lore append from block 0 15 0 front_text.messages[0]
#NEUN_SCRIPT end
setblock 0 15 0 minecraft:air

# add category info
data modify storage tmp.fetchr:init itemCategories[-1] merge from storage tmp.fetchr:init currentCategories[-1]
data modify storage tmp.fetchr:init initializedItems[-1].categories append from storage tmp.fetchr:init itemCategories[-1]

# loop
data remove storage tmp.fetchr:init currentCategories[-1]
execute if data storage tmp.fetchr:init currentCategories[0] run function fetchr:init/items/add_category_info
