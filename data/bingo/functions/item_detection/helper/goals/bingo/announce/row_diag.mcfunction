execute if score $diag bingo.tmp matches 1 run tellraw @a {"translate":"bingo.got_bingo.double.row_diag.top_left", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$row", "objective": "bingo.tmp"}}]}
execute if score $diag bingo.tmp matches 2 run tellraw @a {"translate":"bingo.got_bingo.double.row_diag.bottom_left", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$row", "objective": "bingo.tmp"}}]}
execute if score $diag bingo.tmp matches 3 run tellraw @a {"translate":"bingo.got_bingo.triple.row_diags", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$row", "objective": "bingo.tmp"}}]}

execute as @a[tag=bingo.in_current_team] at @s run function bingo:item_detection/helper/goals/completed_goal_effects

data modify storage bingo:card teams[{selected: true}].hasBingo set value true