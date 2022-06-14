#> bingo:init/items/normalize_categories
#
# Changes the item category list to have compound entries with id and weight.
#
# Weight is optional and defaults to the global weight (which in turn defaults
# to 1) and if weight is omitted, a string list can be used in the definition
# instead.
#
# This makes sure all items use the same format for easier handeling further
# down the line.
#
# @within
# 	function bingo:init/items/first_pass
# 	function bingo:init/items/normalize_categories

#>
# @private
#declare score_holder $init/items/normalize.is_string
execute store success score $init/items/normalize.is_string bingo.tmp run data modify entity @e[type=minecraft:area_effect_cloud, tag=bingo.string_tester, limit=1] Tags append from storage tmp.bingo:init itemCategories[-1]
execute if score $init/items/normalize.is_string bingo.tmp matches 1 run data modify entity @e[type=minecraft:area_effect_cloud, tag=bingo.string_tester, limit=1] Tags set value ["bingo.string_tester"]

data modify storage tmp.bingo:init category set value {}
execute if score $init/items/normalize.is_string bingo.tmp matches 1 run data modify storage tmp.bingo:init category.id set from storage tmp.bingo:init itemCategories[-1]
execute if score $init/items/normalize.is_string bingo.tmp matches 0 run data modify storage tmp.bingo:init category set from storage tmp.bingo:init itemCategories[-1]

execute unless data storage tmp.bingo:init category.weight unless data storage tmp.bingo:init items[-1].weight run data modify storage tmp.bingo:init category.weight set value 1
execute unless data storage tmp.bingo:init category.weight run data modify storage tmp.bingo:init category.weight set from storage tmp.bingo:init items[-1].weight

#sanity checks
#>
# @private
#declare score_holder $init/items/normalize.weight
execute store result score $init/items/normalize.weight bingo.tmp run data get storage tmp.bingo:init category.weight
execute store result storage tmp.bingo:init category.weight int 1 run scoreboard players get $init/items/normalize.weight bingo.tmp

execute unless data storage tmp.bingo:init category.id run tellraw @a [{"text": "[", "color": "red"}, {"translate": "bingo.logging.error"}, "] ", {"translate": "bingo.setup.error.item_category_without_id", "with": [{"storage": "tmp.bingo:init", "nbt": "items[-1].id"}, {"storage": "tmp.bingo:init", "nbt": "itemCategories[-1]"}]}]
execute if data storage tmp.bingo:init category.id if score $init/items/normalize.weight bingo.tmp matches ..0 run tellraw @a [{"text": "[", "color": "red"}, {"translate": "bingo.logging.error"}, "] ", {"translate": "bingo.setup.error.item_category_weight_below_1", "with": [{"storage": "tmp.bingo:init", "nbt": "items[-1].id"}, {"storage": "tmp.bingo:init", "nbt": "category.id"}, {"score": {"name": "$init/items/normalize.weight", "objective": "bingo.tmp"}}]}]

execute if data storage tmp.bingo:init category.id if score $init/items/normalize.weight bingo.tmp matches 1.. run data modify storage tmp.bingo:init items[-1].categories append from storage tmp.bingo:init category

# loop
data remove storage tmp.bingo:init itemCategories[-1]
execute if data storage tmp.bingo:init itemCategories[0] run function bingo:init/items/normalize_categories