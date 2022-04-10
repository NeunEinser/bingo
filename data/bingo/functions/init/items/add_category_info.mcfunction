#> bingo:init/items/add_category_info
#
# Adds the category name to the item's lore and adds full information to item
# categories
#
# @input storage tmp.bingo:init itemCategories
# @writes storage tmp.bingo:init items[-1].item.tag.display.Lore
# @within
# 	function bingo:init/items/second_pass
# 	function bingo:init/items/add_category_info

data modify storage tmp.bingo:init itemCategories set from storage tmp.bingo:init itemCategoriesCopy
data modify storage tmp.bingo:init searchedCategory set from storage tmp.bingo:init currentCategories[-1].id
function bingo:init/items/find_item_category

# set lore
setblock 0 255 0 minecraft:oak_sign{Text1: '[{"text": "  • ", "color": "gray", "italic": false}, {"storage": "tmp.bingo:init", "nbt": "currentCategories[-1].name", "interpret": true}, " (", {"storage": "tmp.bingo:init", "nbt": "itemCategories[-1].weight"}, "/", {"storage": "tmp.bingo:init", "nbt": "currentCategories[-1].totalItemWeight"}, ")"]'}
data modify storage tmp.bingo:init initializedItems[-1].item.tag.display.Lore append from block 0 255 0 Text1
setblock 0 255 0 minecraft:air

# add category info
data modify storage tmp.bingo:init itemCategories[-1] merge from storage tmp.bingo:init currentCategories[-1]
data modify storage tmp.bingo:init initializedItems[-1].categories append from storage tmp.bingo:init itemCategories[-1]

# loop
data remove storage tmp.bingo:init currentCategories[-1]
execute if data storage tmp.bingo:init currentCategories[0] run function bingo:init/items/add_category_info