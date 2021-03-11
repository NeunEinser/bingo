#> bingo:item_detection/helper/goals/bingo/announce/col_diag
#
# Announces reaching a bingo in a column and at least one diagonal
#
# @within function bingo:item_detection/helper/goals/bingo/detect_bingo_and_20_no_bingo

execute if score $item_detect/bingo.diagonal bingo.tmp matches 1 run tellraw @a {"translate":"bingo.got_bingo.double.col_diag.top_left", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$item_detect/bingo.column", "objective": "bingo.tmp"}}]}
execute if score $item_detect/bingo.diagonal bingo.tmp matches 2 run tellraw @a {"translate":"bingo.got_bingo.double.col_diag.bottom_left", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$item_detect/bingo.column", "objective": "bingo.tmp"}}]}
execute if score $item_detect/bingo.diagonal bingo.tmp matches 3 run tellraw @a {"translate":"bingo.got_bingo.triple.col_diags", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$item_detect/bingo.column", "objective": "bingo.tmp"}}]}

execute as @a[tag=bingo.in_current_team] at @s run function bingo:item_detection/helper/goals/completed_goal_effects

data modify storage bingo:card teams[-1].hasBingo set value true