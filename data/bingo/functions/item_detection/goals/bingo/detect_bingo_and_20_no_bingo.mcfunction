#> bingo:item_detection/goals/bingo/detect_bingo_and_20_no_bingo
#
# This function checks for bingo and 20 no bingo goals.
#
# @within function bingo:item_detection/announce

#>
# The row a bingo was achieved.
#
# 0 means no row has a bingo
#
# @within function bingo:item_detection/goals/bingo/**
#declare score_holder $item_detect/bingo.row
#>
# The column a bingo was achieved.
#
# 0 means no row has a bingo
#
# @within function bingo:item_detection/goals/bingo/**
#declare score_holder $item_detect/bingo.column
#>
# The diagonal a bingo was achieved.
#
# 0 means no row has a bingo
#
# @within function bingo:item_detection/goals/bingo/**
#declare score_holder $item_detect/bingo.diagonal
#>
# The slot number the current item is in.
#
# @within function bingo:item_detection/goals/bingo/**
#declare score_holder $item_detect/bingo.slot
#>
# The column the current item is in.
#
# @within function bingo:item_detection/goals/bingo/**
#declare score_holder $item_detect/bingo.item_column
#>
# 0, if the item is in the top left to bottom right diagonal
#
# @within function bingo:item_detection/goals/bingo/**
#declare score_holder $item_detect/bingo.top_left
#>
# 0, if the item is in the bottom left to top right diagonal
#
# @within function bingo:item_detection/goals/bingo/**
#declare score_holder $item_detect/bingo.bottom_left

# setup
scoreboard players set $item_detect/bingo.row bingo.tmp 0
scoreboard players set $item_detect/bingo.column bingo.tmp 0
scoreboard players set $item_detect/bingo.diagonal bingo.tmp 0

execute store result score $item_detect/bingo.slot bingo.tmp run data get storage tmp.bingo:input/item_detection slot.id

scoreboard players operation $item_detect/bingo.item_column bingo.tmp = $item_detect/bingo.slot bingo.tmp
scoreboard players operation $item_detect/bingo.item_column bingo.tmp %= 5 bingo.const

scoreboard players operation $item_detect/bingo.top_left bingo.tmp = $item_detect/bingo.slot bingo.tmp
scoreboard players operation $item_detect/bingo.top_left bingo.tmp %= 6 bingo.const

scoreboard players operation $item_detect/bingo.bottom_left bingo.tmp = $item_detect/bingo.slot bingo.tmp
scoreboard players operation $item_detect/bingo.bottom_left bingo.tmp %= 4 bingo.const

# detect in rows
execute if score $item_detect/bingo.slot bingo.tmp matches ..4 run function bingo:item_detection/goals/bingo/row/1
execute if score $item_detect/bingo.slot bingo.tmp matches 5..9 run function bingo:item_detection/goals/bingo/row/2
execute if score $item_detect/bingo.slot bingo.tmp matches 10..14 run function bingo:item_detection/goals/bingo/row/3
execute if score $item_detect/bingo.slot bingo.tmp matches 15..19 run function bingo:item_detection/goals/bingo/row/4
execute if score $item_detect/bingo.slot bingo.tmp matches 20..24 run function bingo:item_detection/goals/bingo/row/5

# detect in columns
execute if score $item_detect/bingo.item_column bingo.tmp matches 0 run function bingo:item_detection/goals/bingo/col/1
execute if score $item_detect/bingo.item_column bingo.tmp matches 1 run function bingo:item_detection/goals/bingo/col/2
execute if score $item_detect/bingo.item_column bingo.tmp matches 2 run function bingo:item_detection/goals/bingo/col/3
execute if score $item_detect/bingo.item_column bingo.tmp matches 3 run function bingo:item_detection/goals/bingo/col/4
execute if score $item_detect/bingo.item_column bingo.tmp matches 4 run function bingo:item_detection/goals/bingo/col/5

# detect in diagonals
execute if score $item_detect/bingo.top_left bingo.tmp matches 0 run function bingo:item_detection/goals/bingo/diagonals/top_left
execute if score $item_detect/bingo.bottom_left bingo.tmp matches 0 unless score $item_detect/bingo.slot bingo.tmp matches 0 unless score $item_detect/bingo.slot bingo.tmp matches 24 run function bingo:item_detection/goals/bingo/diagonals/bottom_left

# announce bingo
## Ordinary Bingo
execute if score $item_detect/bingo.row bingo.tmp matches 0 if score $item_detect/bingo.column bingo.tmp matches 1.. if score $item_detect/bingo.diagonal bingo.tmp matches 0 run function bingo:item_detection/goals/bingo/announce/col
execute if score $item_detect/bingo.row bingo.tmp matches 1.. if score $item_detect/bingo.column bingo.tmp matches 0 if score $item_detect/bingo.diagonal bingo.tmp matches 0 run function bingo:item_detection/goals/bingo/announce/row

## Ordinary or Double Bingo
execute if score $item_detect/bingo.row bingo.tmp matches 0 if score $item_detect/bingo.column bingo.tmp matches 0 if score $item_detect/bingo.diagonal bingo.tmp matches 1.. run function bingo:item_detection/goals/bingo/announce/diag

## Double Bingo
execute if score $item_detect/bingo.row bingo.tmp matches 1.. if score $item_detect/bingo.column bingo.tmp matches 1.. if score $item_detect/bingo.diagonal bingo.tmp matches 0 run function bingo:item_detection/goals/bingo/announce/col_row
execute if score $item_detect/bingo.row bingo.tmp matches 0 if score $item_detect/bingo.column bingo.tmp matches 1.. if score $item_detect/bingo.diagonal bingo.tmp matches 1.. run function bingo:item_detection/goals/bingo/announce/col_diag
execute if score $item_detect/bingo.row bingo.tmp matches 1.. if score $item_detect/bingo.column bingo.tmp matches 0 if score $item_detect/bingo.diagonal bingo.tmp matches 1.. run function bingo:item_detection/goals/bingo/announce/row_diag

# Triple or Quadruple Bingo
execute if score $item_detect/bingo.row bingo.tmp matches 1.. if score $item_detect/bingo.column bingo.tmp matches 1.. if score $item_detect/bingo.diagonal bingo.tmp matches 1.. run function bingo:item_detection/goals/bingo/announce/col_row_diag

# announce 20 no bingo
execute if score $item_detect/bingo.row bingo.tmp matches 0 if score $item_detect/bingo.column bingo.tmp matches 0 if score $item_detect/bingo.diagonal bingo.tmp matches 0 if score $item_detect/announce.items bingo.tmp matches 20 run function bingo:item_detection/goals/announce_20_no_bingo