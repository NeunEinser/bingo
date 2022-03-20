#> bingo:init/items
#
# Adds the item to all categories it belongs to.
#
# @within
# 	function bingo:init/init
# 	function bingo:init/items
# @writes storage bingo:items categories

#>
# @within
# 	function bingo:init/items
# 	function bingo:init/items/**
#declare tag bingo.string_tester
summon minecraft:area_effect_cloud ~ ~ ~ {Tags: ["bingo.string_tester"]}

data modify storage tmp.bingo:init itemCategories set from storage tmp.bingo:init items[-1].categories
data remove storage tmp.bingo:init items[-1].categories[]
function bingo:init/items/normalize_categories
data remove storage tmp.bingo:init items[-1].weight

data modify storage tmp.bingo:init itemCategories set from storage tmp.bingo:init items[-1].categories
function bingo:init/items/find_categories

data modify storage tmp.bingo:init items[-1].item.tag.display.Lore append value '{"translate": "bingo.categories.header", "color": "gray", "italic": false}'
data modify storage tmp.bingo:init itemCategories set from storage tmp.bingo:init categories

function bingo:init/items/add_category_names_to_lore

data modify storage tmp.bingo:init items[-1].item.tag.display.Lore append value '""'
data modify storage tmp.bingo:init items[-1].item.Count set value 1b

setblock 0 255 0 minecraft:oak_sign{Text1:'{"storage": "tmp.bingo:init", "nbt": "items[-1].textComponent", "interpret": true, "italic": false}'}
data modify storage tmp.bingo:init items[-1].item.tag.display.Name set from block 0 255 0 Text1
setblock 0 255 0 minecraft:air

data modify storage tmp.bingo:init categories[].items append from storage tmp.bingo:init items[-1]

function bingo:init/items/set_category_specific

data modify storage bingo:items items append from storage tmp.bingo:init items[-1]

data modify storage bingo:items categories append from storage tmp.bingo:init skippedCategories[]
data modify storage bingo:items categories append from storage tmp.bingo:init categories[]
data remove storage tmp.bingo:init skippedCategories
data remove storage tmp.bingo:init categories

data remove storage tmp.bingo:init items[-1]
execute if data storage tmp.bingo:init items[0] run function bingo:init/items