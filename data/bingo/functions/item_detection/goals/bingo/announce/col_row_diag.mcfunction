#> bingo:item_detection/goals/bingo/announce/col_row_diag
#
# Announces reaching a bingo in one column, one row and at least one diagonal
#
# @within function bingo:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

execute unless score $item_detect/announce.items bingo.tmp matches 13 if score $item_detect/bingo.diagonal bingo.tmp matches 1 run tellraw @a {"translate":"bingo.got_bingo.triple.top_left", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$item_detect/bingo.column", "objective": "bingo.tmp"}}, {"score": {"name": "$item_detect/bingo.row", "objective": "bingo.tmp"}}]}
execute unless score $item_detect/announce.items bingo.tmp matches 13 if score $item_detect/bingo.diagonal bingo.tmp matches 2 run tellraw @a {"translate":"bingo.got_bingo.triple.bottom_left", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$item_detect/bingo.column", "objective": "bingo.tmp"}}, {"score": {"name": "$item_detect/bingo.row", "objective": "bingo.tmp"}}]}
execute unless score $item_detect/announce.items bingo.tmp matches 17 if score $item_detect/bingo.diagonal bingo.tmp matches 3 run tellraw @a {"translate":"bingo.got_bingo.quadruple", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}]}
execute if score $item_detect/announce.items bingo.tmp matches 13 if score $item_detect/bingo.diagonal bingo.tmp matches 1 run tellraw @a {"translate":"bingo.got_sniper_bingo.triple.top_left", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$item_detect/bingo.column", "objective": "bingo.tmp"}}, {"score": {"name": "$item_detect/bingo.row", "objective": "bingo.tmp"}}]}
execute if score $item_detect/announce.items bingo.tmp matches 13 if score $item_detect/bingo.diagonal bingo.tmp matches 2 run tellraw @a {"translate":"bingo.got_sniper_bingo.triple.bottom_left", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$item_detect/bingo.column", "objective": "bingo.tmp"}}, {"score": {"name": "$item_detect/bingo.row", "objective": "bingo.tmp"}}]}
execute if score $item_detect/announce.items bingo.tmp matches 17 if score $item_detect/bingo.diagonal bingo.tmp matches 3 run tellraw @a {"translate":"bingo.got_sniper_bingo.quadruple", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}]}

execute as @a[tag=bingo.in_current_team] at @s run function bingo:item_detection/goals/completed_goal_effects

data modify storage bingo:card teams[-1].hasBingo set value true