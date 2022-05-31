#> bingo:init/items/first_pass
#
# Initializes and normalizes items and item categories. Calculates total item
# weight for each category.
#
# @within
# 	function bingo:init/items/exec
# 	function bingo:init/items/first_pass
# @writes storage bingo:items categories

data modify storage tmp.bingo:init itemCategories set from storage tmp.bingo:init items[-1].categories
data remove storage tmp.bingo:init items[-1].categories[]
function bingo:init/items/normalize_categories
data remove storage tmp.bingo:init items[-1].weight

data modify storage tmp.bingo:init itemCategories set from storage tmp.bingo:init items[-1].categories
function bingo:init/items/find_categories
data modify storage bingo:items categories append from storage tmp.bingo:init skippedCategories[]
data remove storage tmp.bingo:init skippedCategories

data modify storage tmp.bingo:init items[-1].item.Count set value 1b

setblock 0 255 0 minecraft:oak_sign{Text1:'{"storage": "tmp.bingo:init", "nbt": "items[-1].textComponent", "interpret": true, "italic": false}'}

data modify storage tmp.bingo:init items[-1].item.tag.display.Name set from block 0 255 0 Text1
setblock 0 255 0 minecraft:air

function bingo:init/items/update_category_total_weight
data remove storage tmp.bingo:init categories

data modify storage tmp.bingo:init initializedItems append from storage tmp.bingo:init items[-1]
data remove storage tmp.bingo:init items[-1]

execute if data storage tmp.bingo:init items[0] run function bingo:init/items/first_pass