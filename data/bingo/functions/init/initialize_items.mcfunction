#> bingo:init/initialize_items
#
# Adds the item to all categories it belongs to.
#
# @within
# 	function bingo:init/init
# 	function bingo:init/initialize_items
# @writes storage bingo:items categories

data modify storage temp:bingo.init itemCategories set from storage temp:bingo.init items[-1].categories

function bingo:init/find_categories

data modify storage temp:bingo.init items[-1].item.tag.display.Lore append value '{"translate": "bingo.categories.header", "color": "gray", "italic": false}'
data modify storage temp:bingo.init itemCategories set from storage temp:bingo.init categories

function bingo:init/add_category_names_to_lore

data modify storage temp:bingo.init items[-1].item.tag.display.Lore append value '""'

setblock 0 255 0 minecraft:oak_sign{Text1: '{"translate": "bingo.items.weight", "color": "gray", "italic": false, "with": [{"storage": "temp:bingo.init", "nbt": "items[-1].weight"}]}'} 
data modify storage temp:bingo.init items[-1].item.tag.display.Lore append from block 0 255 0 Text1
setblock ~ 255 ~ minecraft:air

data modify storage temp:bingo.init items[-1].item.Count set value 1b

setblock 0 255 0 minecraft:oak_sign{Text1: '{"storage": "temp:bingo.init", "nbt": "items[-1].textComponent", "interpret": true, "italic": false}'} 
data modify storage temp:bingo.init items[-1].item.tag.display.Name set from block 0 255 0 Text1
setblock ~ 255 ~ minecraft:air

data modify storage temp:bingo.init categories[].items append from storage temp:bingo.init items[-1]
data modify storage bingo:items items append from storage temp:bingo.init items[-1]

data modify storage bingo:items categories append from storage temp:bingo.init skippedCategories[]
data modify storage bingo:items categories append from storage temp:bingo.init categories[]
data remove storage temp:bingo.init skippedCategories
data remove storage temp:bingo.init categories

data remove storage temp:bingo.init items[-1]
execute if data storage temp:bingo.init items[0] run function bingo:init/initialize_items