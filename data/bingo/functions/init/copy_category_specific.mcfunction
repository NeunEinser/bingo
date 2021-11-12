#> bingo:init/copy_category_specific
#
# Copies the category specific weight to the item in the category
#
# @within
# 	function bingo:init/initialize_items
# 	function bingo:init/copy_category_specific

data modify storage tmp.bingo:init itemCategories set from storage tmp.bingo:init items[-1].categories
function bingo:init/find_item_category

execute if data storage tmp.bingo:init itemCategories[-1].weight run data modify storage tmp.bingo:init categories[-1].items[-1].weight set from storage tmp.bingo:init itemCategories[-1].weight

setblock 0 255 0 minecraft:oak_sign{Text1: '{"translate": "bingo.items.weight", "color": "gray", "italic": false, "with": [{"storage": "tmp.bingo:init", "nbt": "categories[-1].items[-1].weight"}]}'} 
data modify storage tmp.bingo:init categories[-1].items[-1].item.tag.display.Lore append from block 0 255 0 Text1
setblock 0 255 0 minecraft:air

# Update category's total item weight
#>
# @private
#declare score_holder $init/items/catrgory.total_weight
execute store result score $init/items/catrgory.total_weight bingo.tmp run data get storage tmp.bingo:init categories[-1].totalItemWeight
#>
# @private
#declare score_holder $init/items/catrgory.item_weight
execute store result score $init/items/catrgory.item_weight bingo.tmp run data get storage tmp.bingo:init categories[-1].items[-1].weight
scoreboard players operation $init/items/catrgory.total_weight bingo.tmp += $init/items/catrgory.item_weight bingo.tmp

execute store result storage tmp.bingo:init categories[-1].totalItemWeight int 1 run scoreboard players get $init/items/catrgory.total_weight bingo.tmp

data modify storage bingo:items categories append from storage tmp.bingo:init categories[-1]
data remove storage tmp.bingo:init categories[-1]

execute if data storage tmp.bingo:init categories[0] run function bingo:init/copy_category_specific