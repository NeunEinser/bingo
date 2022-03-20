#> bingo:init/items/add_category_names_to_lore
#
# Adds the category name to the item's lore
#
# @input storage tmp.bingo:init itemCategories
# @writes storage tmp.bingo:init items[-1].item.tag.display.Lore
# @within
# 	function bingo:init/items
# 	function bingo:init/items/add_category_names_to_lore

setblock 0 255 0 minecraft:oak_sign{Text1: '[{"text": "  • ", "color": "gray", "italic": false}, {"storage": "tmp.bingo:init", "nbt": "itemCategories[-1].name", "interpret": true}]'}
data modify storage tmp.bingo:init items[-1].item.tag.display.Lore append from block 0 255 0 Text1

setblock 0 255 0 minecraft:air
data remove storage tmp.bingo:init itemCategories[-1]

execute if data storage tmp.bingo:init itemCategories[-1] run function bingo:init/items/add_category_names_to_lore