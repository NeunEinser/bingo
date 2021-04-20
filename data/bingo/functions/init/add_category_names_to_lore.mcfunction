#> bingo:init/add_category_names_to_lore
#
# Adds the translatable category name to the item's lore
#
# @input storage temp:bingo.init itemCategories
# @writes storage temp:bingo.init items[-1].item.tag.display.Lore
# @within
# 	function bingo:init/initialize_items
# 	function bingo:init/add_category_names_to_lore

setblock ~ 255 ~ minecraft:oak_sign{Text1: '[{"text": "  \\u2022 ", "color": "gray", "italic": false}, {"storage": "temp:bingo.init", "nbt": "itemCategories[-1].translatableName", "interpret": true}]'} 
data modify storage temp:bingo.init items[-1].item.tag.display.Lore append from block 0 255 0 Text1

setblock ~ 255 ~ minecraft:air
data remove storage temp:bingo.init itemCategories[-1]

execute if data storage temp:bingo.init itemCategories[-1] run function bingo:init/add_category_names_to_lore