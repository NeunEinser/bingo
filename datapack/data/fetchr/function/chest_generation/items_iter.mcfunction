#> fetchr:lobby/chest_generation/items_iter
#
# Place the current item into the chest
#
# @within
# 	function fetchr:lobby/chest_generation/category_iter
# 	function fetchr:lobby/chest_generation/items_iter
# @context position The position of the current chest

#>
# @private
#declare score_holder $chest_generation.chest_row
scoreboard players operation $chest_generation.chest_row fetchr.tmp = $chest_generation.row fetchr.tmp
scoreboard players operation $chest_generation.chest_row fetchr.tmp %= 3 fetchr.const

#>
# @private
#declare score_holder $chest_generation.chest_col
scoreboard players operation $chest_generation.chest_col fetchr.tmp = $chest_generation.column fetchr.tmp
scoreboard players operation $chest_generation.chest_col fetchr.tmp %= 9 fetchr.const

#>
# @within function fetchr:lobby/chest_generation/*
#declare score_holder $chest_generation.slot
scoreboard players set $chest_generation.slot fetchr.tmp 9
scoreboard players operation $chest_generation.slot fetchr.tmp *= $chest_generation.chest_row fetchr.tmp
scoreboard players operation $chest_generation.slot fetchr.tmp += $chest_generation.chest_col fetchr.tmp

data modify storage tmp.fetchr:chest_generation item set from storage tmp.fetchr:chest_generation items[-1]
data modify storage tmp.fetchr:chest_generation item_categories set from storage tmp.fetchr:chest_generation item.active_categories

data remove storage tmp.fetchr:chest_generation items[-1]

execute \
	store result storage tmp.fetchr:chest_generation item.item.Slot byte 1 \
	run scoreboard players get $chest_generation.slot fetchr.tmp

execute \
	if score $chest_generation.row fetchr.tmp matches ..2 \
	if score $chest_generation.column fetchr.tmp matches ..8 \
	run data modify block ~1 ~ ~ Items append from storage tmp.fetchr:chest_generation item.item
execute \
	if score $chest_generation.row fetchr.tmp matches 3.. \
	run data modify block ~ ~ ~ Items append from storage tmp.fetchr:chest_generation item.item
execute \
	if score $chest_generation.column fetchr.tmp matches 9.. \
	run data modify block ~ ~ ~ Items append from storage tmp.fetchr:chest_generation item.item

execute \
	if data storage tmp.fetchr:chest_generation items[-1] \
	if score $chest_generation.row fetchr.tmp matches 5 \
	run function fetchr:lobby/chest_generation/increment_column
execute \
	if block ~ ~ ~ minecraft:chest[type=single] \
	if data storage tmp.fetchr:chest_generation items[-1] \
	if score $chest_generation.row fetchr.tmp matches 2 \
	run function fetchr:lobby/chest_generation/increment_column
scoreboard players add $chest_generation.row fetchr.tmp 1

execute if data storage tmp.fetchr:chest_generation items[-1] run function fetchr:lobby/chest_generation/items_iter