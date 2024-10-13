#> fetchr:init/items/normalize_categories
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
# 	function fetchr:init/items/first_pass
# 	function fetchr:init/items/normalize_categories

#>
# @private
#declare score_holder $init/items/normalize.is_string
execute store success score $init/items/normalize.is_string fetchr.tmp run data modify entity @s Tags append from storage tmp.fetchr:init item_categories[-1]
execute if score $init/items/normalize.is_string fetchr.tmp matches 1 run data modify entity @s Tags set value ["fetchr.string_tester"]

data modify storage tmp.fetchr:init category set value {}
execute if score $init/items/normalize.is_string fetchr.tmp matches 1 run data modify storage tmp.fetchr:init category.id set from storage tmp.fetchr:init item_categories[-1]
execute if score $init/items/normalize.is_string fetchr.tmp matches 0 run data modify storage tmp.fetchr:init category set from storage tmp.fetchr:init item_categories[-1]

execute unless data storage tmp.fetchr:init category.weight unless data storage tmp.fetchr:init items[-1].weight run data modify storage tmp.fetchr:init category.weight set value 1
execute unless data storage tmp.fetchr:init category.weight run data modify storage tmp.fetchr:init category.weight set from storage tmp.fetchr:init items[-1].weight

#sanity checks
#>
# @private
#declare score_holder $init/items/normalize.weight
execute store result score $init/items/normalize.weight fetchr.tmp run data get storage tmp.fetchr:init category.weight
execute store result storage tmp.fetchr:init category.weight int 1 run scoreboard players get $init/items/normalize.weight fetchr.tmp

execute unless data storage tmp.fetchr:init category.id run tellraw @a [{"text": "[", "color": "red"}, {"translate": "fetchr.logging.error"}, "] ", {"translate": "fetchr.setup.error.item_category_without_id", "with": [{"storage": "tmp.fetchr:init", "nbt": "items[-1].id"}, {"storage": "tmp.fetchr:init", "nbt": "item_categories[-1]"}]}]
execute if data storage tmp.fetchr:init category.id if score $init/items/normalize.weight fetchr.tmp matches ..0 run tellraw @a [{"text": "[", "color": "red"}, {"translate": "fetchr.logging.error"}, "] ", {"translate": "fetchr.setup.error.item_category_weight_below_1", "with": [{"storage": "tmp.fetchr:init", "nbt": "items[-1].id"}, {"storage": "tmp.fetchr:init", "nbt": "category.id"}, {"score": {"name": "$init/items/normalize.weight", "objective": "fetchr.tmp"}}]}]

execute if data storage tmp.fetchr:init category.id if score $init/items/normalize.weight fetchr.tmp matches 1.. run data modify storage tmp.fetchr:init items[-1].categories append from storage tmp.fetchr:init category

# loop
data remove storage tmp.fetchr:init item_categories[-1]
execute if data storage tmp.fetchr:init item_categories[0] run function fetchr:init/items/normalize_categories