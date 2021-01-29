scoreboard players set $row bingo.tmp 0
scoreboard players set $col bingo.tmp 0
scoreboard players set $diag bingo.tmp 0

execute store result score $slot bingo.tmp run data get storage bingo:card slots[{selected: true}].id

execute if score $slot bingo.tmp matches ..4 run function bingo:item_detection/helper/goals/bingo/row/1
execute if score $slot bingo.tmp matches 5..9 run function bingo:item_detection/helper/goals/bingo/row/2
execute if score $slot bingo.tmp matches 10..14 run function bingo:item_detection/helper/goals/bingo/row/3
execute if score $slot bingo.tmp matches 15..19 run function bingo:item_detection/helper/goals/bingo/row/4
execute if score $slot bingo.tmp matches 20..24 run function bingo:item_detection/helper/goals/bingo/row/5

scoreboard players operation $mod bingo.tmp = $slot bingo.tmp
scoreboard players operation $mod bingo.tmp %= 5 bingo.const

execute if score $mod bingo.tmp matches 0 run function bingo:item_detection/helper/goals/bingo/col/1
execute if score $mod bingo.tmp matches 1 run function bingo:item_detection/helper/goals/bingo/col/2
execute if score $mod bingo.tmp matches 2 run function bingo:item_detection/helper/goals/bingo/col/3
execute if score $mod bingo.tmp matches 3 run function bingo:item_detection/helper/goals/bingo/col/4
execute if score $mod bingo.tmp matches 4 run function bingo:item_detection/helper/goals/bingo/col/5

scoreboard players operation $mod bingo.tmp = $slot bingo.tmp
scoreboard players operation $mod bingo.tmp %= 6 bingo.const
execute if score $mod bingo.tmp matches 0 run function bingo:item_detection/helper/goals/bingo/diagonals/top_left

scoreboard players operation $mod bingo.tmp = $slot bingo.tmp
scoreboard players operation $mod bingo.tmp %= 4 bingo.const
execute if score $mod bingo.tmp matches 0 unless score $slot bingo.tmp matches 0 unless score $slot bingo.tmp matches 24 run function bingo:item_detection/helper/goals/bingo/diagonals/bottom_left

execute if score $row bingo.tmp matches 1.. if score $col bingo.tmp matches 1.. if score $diag bingo.tmp matches 1.. run function bingo:item_detection/helper/goals/bingo/announce/col_row_diag
execute if score $row bingo.tmp matches 1.. if score $col bingo.tmp matches 1.. if score $diag bingo.tmp matches 0 run function bingo:item_detection/helper/goals/bingo/announce/col_row
execute if score $row bingo.tmp matches 1.. if score $col bingo.tmp matches 0 if score $diag bingo.tmp matches 1.. run function bingo:item_detection/helper/goals/bingo/announce/row_diag
execute if score $row bingo.tmp matches 1.. if score $col bingo.tmp matches 0 if score $diag bingo.tmp matches 0 run function bingo:item_detection/helper/goals/bingo/announce/row
execute if score $row bingo.tmp matches 0 if score $col bingo.tmp matches 1.. if score $diag bingo.tmp matches 1.. run function bingo:item_detection/helper/goals/bingo/announce/col_diag
execute if score $row bingo.tmp matches 0 if score $col bingo.tmp matches 1.. if score $diag bingo.tmp matches 0 run function bingo:item_detection/helper/goals/bingo/announce/col
execute if score $row bingo.tmp matches 0 if score $col bingo.tmp matches 0 if score $diag bingo.tmp matches 1.. run function bingo:item_detection/helper/goals/bingo/announce/diag
execute if score $row bingo.tmp matches 0 if score $col bingo.tmp matches 0 if score $diag bingo.tmp matches 0 if score $items bingo.tmp matches 20 run tellraw @a {"translate": "bingo.got_20_no_bingo", "with": [{"storage": "timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}]}