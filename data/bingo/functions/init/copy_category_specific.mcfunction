#> bingo:init/copy_category_specific
#
# Copies the category specific weight to the item in the category
#
# @within
# 	function bingo:init/initialize_items
# 	function bingo:init/copy_category_specific

data modify storage temp:bingo.init itemCategories set from storage temp:bingo.init items[-1].categories
function bingo:init/find_item_category

execute if data storage temp:bingo.init itemCategories[-1].weight run data modify storage temp:bingo.init categories[-1].items[-1].weight set from storage temp:bingo.init itemCategories[-1].weight

setblock 0 255 0 minecraft:oak_sign{Text1: '{"translate": "bingo.items.weight", "color": "gray", "italic": false, "with": [{"storage": "temp:bingo.init", "nbt": "itemCategories[-1].weight"}]}'} 
execute if data storage temp:bingo.init itemCategories[-1].weight run data modify storage temp:bingo.init categories[-1].items[-1].item.tag.display.Lore[-1] set from block 0 255 0 Text1
setblock ~ 255 ~ minecraft:air

data modify storage bingo:items categories append from storage temp:bingo.init categories[-1]
data remove storage temp:bingo.init categories[-1]

execute if data storage temp:bingo.init categories[0] run function bingo:init/copy_category_specific