#> bingo:lobby/chest_generation/items_iter
#
# Place the current item into the chest
#
# @within
# 	function bingo:lobby/chest_generation/category_iter
# 	function bingo:lobby/chest_generation/items_iter
# @context position The position of the current chest

#>
# @private
#declare score_holder $chest_generation.chest_row
scoreboard players operation $chest_generation.chest_row bingo.tmp = $chest_generation.row bingo.tmp
scoreboard players operation $chest_generation.chest_row bingo.tmp %= 3 bingo.const

#>
# @private
#declare score_holder $chest_generation.chest_col
scoreboard players operation $chest_generation.chest_col bingo.tmp = $chest_generation.column bingo.tmp
scoreboard players operation $chest_generation.chest_col bingo.tmp %= 9 bingo.const

#>
# @within function bingo:lobby/chest_generation/*
#declare score_holder $chest_generation.slot
scoreboard players set $chest_generation.slot bingo.tmp 9
scoreboard players operation $chest_generation.slot bingo.tmp *= $chest_generation.chest_row bingo.tmp
scoreboard players operation $chest_generation.slot bingo.tmp += $chest_generation.chest_col bingo.tmp

data modify storage tmp.bingo:chest_generation item set from storage tmp.bingo:chest_generation items[-1]
data remove storage tmp.bingo:chest_generation items[-1]

execute store result storage tmp.bingo:chest_generation item.item.Slot byte 1 run scoreboard players get $chest_generation.slot bingo.tmp

execute if score $chest_generation.row bingo.tmp matches ..2 if score $chest_generation.column bingo.tmp matches ..8 run data modify block ~1 ~ ~ Items append from storage tmp.bingo:chest_generation item.item
execute if score $chest_generation.row bingo.tmp matches 3.. run data modify block ~ ~ ~ Items append from storage tmp.bingo:chest_generation item.item
execute if score $chest_generation.column bingo.tmp matches 9.. run data modify block ~ ~ ~ Items append from storage tmp.bingo:chest_generation item.item

execute if data storage tmp.bingo:chest_generation items[-1] if score $chest_generation.row bingo.tmp matches 5 run function bingo:lobby/chest_generation/increment_column
execute if block ~ ~ ~ minecraft:chest[type=single] if data storage tmp.bingo:chest_generation items[-1] if score $chest_generation.row bingo.tmp matches 2 run function bingo:lobby/chest_generation/increment_column
scoreboard players add $chest_generation.row bingo.tmp 1

execute if data storage tmp.bingo:chest_generation items[-1] run function bingo:lobby/chest_generation/items_iter