scoreboard players set $row bingo_tmp 0
scoreboard players set $col bingo_tmp 0
scoreboard players set $diag bingo_tmp 0

execute store result score $slot bingo_tmp run data get storage bingo:card slots[{selected: true}].id

execute if score $slot bingo_tmp matches ..4 run function bingo:item_detection/helper/goals/bingo/row/1
execute if score $slot bingo_tmp matches 5..9 run function bingo:item_detection/helper/goals/bingo/row/2
execute if score $slot bingo_tmp matches 10..14 run function bingo:item_detection/helper/goals/bingo/row/3
execute if score $slot bingo_tmp matches 15..19 run function bingo:item_detection/helper/goals/bingo/row/4
execute if score $slot bingo_tmp matches 20..24 run function bingo:item_detection/helper/goals/bingo/row/5

scoreboard players operation $mod bingo_tmp = $slot bingo_tmp
scoreboard players operation $mod bingo_tmp %= 5 bingo_const

execute if score $mod bingo_tmp matches 0 run function bingo:item_detection/helper/goals/bingo/col/1
execute if score $mod bingo_tmp matches 1 run function bingo:item_detection/helper/goals/bingo/col/2
execute if score $mod bingo_tmp matches 2 run function bingo:item_detection/helper/goals/bingo/col/3
execute if score $mod bingo_tmp matches 3 run function bingo:item_detection/helper/goals/bingo/col/4
execute if score $mod bingo_tmp matches 4 run function bingo:item_detection/helper/goals/bingo/col/5

scoreboard players operation $mod bingo_tmp = $slot bingo_tmp
scoreboard players operation $mod bingo_tmp %= 6 bingo_const
execute if score $mod bingo_tmp matches 0 run function bingo:item_detection/helper/goals/bingo/diagonals/top_left

scoreboard players operation $mod bingo_tmp = $slot bingo_tmp
scoreboard players operation $mod bingo_tmp %= 4 bingo_const
execute if score $mod bingo_tmp matches 0 unless score $slot bingo_tmp matches 0 unless score $slot bingo_tmp matches 24 run function bingo:item_detection/helper/goals/bingo/diagonals/bottom_left

execute if score $row bingo_tmp matches 1.. if score $col bingo_tmp matches 1.. if score $diag bingo_tmp matches 1.. run function bingo:item_detection/helper/goals/bingo/announce/col_row_diag
execute if score $row bingo_tmp matches 1.. if score $col bingo_tmp matches 1.. if score $diag bingo_tmp matches 0 run function bingo:item_detection/helper/goals/bingo/announce/col_row
execute if score $row bingo_tmp matches 1.. if score $col bingo_tmp matches 0 if score $diag bingo_tmp matches 1.. run function bingo:item_detection/helper/goals/bingo/announce/row_diag
execute if score $row bingo_tmp matches 1.. if score $col bingo_tmp matches 0 if score $diag bingo_tmp matches 0 run function bingo:item_detection/helper/goals/bingo/announce/row
execute if score $row bingo_tmp matches 0 if score $col bingo_tmp matches 1.. if score $diag bingo_tmp matches 1.. run function bingo:item_detection/helper/goals/bingo/announce/col_diag
execute if score $row bingo_tmp matches 0 if score $col bingo_tmp matches 1.. if score $diag bingo_tmp matches 0 run function bingo:item_detection/helper/goals/bingo/announce/col
execute if score $row bingo_tmp matches 0 if score $col bingo_tmp matches 0 if score $diag bingo_tmp matches 1.. run function bingo:item_detection/helper/goals/bingo/announce/diag