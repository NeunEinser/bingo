#> bingo:item_detection/helper/goals/bingo/announce/diag
#
# Announces reaching a bingo in at least one diagonal
#
# @within function bingo:item_detection/helper/goals/bingo/detect_bingo_and_20_no_bingo

execute unless score $item_detect/announce.items bingo.tmp matches 5 if score $item_detect/bingo.diagonal bingo.tmp matches 1 run tellraw @a {"translate":"bingo.got_bingo.diag.top_left", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}]}
execute unless score $item_detect/announce.items bingo.tmp matches 5 if score $item_detect/bingo.diagonal bingo.tmp matches 2 run tellraw @a {"translate":"bingo.got_bingo.diag.bottom_left", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}]}
execute unless score $item_detect/announce.items bingo.tmp matches 5 if score $item_detect/bingo.diagonal bingo.tmp matches 3 run tellraw @a {"translate":"bingo.got_bingo.double.diags", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}]}
execute if score $item_detect/announce.items bingo.tmp matches 5 if score $item_detect/bingo.diagonal bingo.tmp matches 1 run tellraw @a {"translate":"bingo.got_sniper_bingo.diag.top_left", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}]}
execute if score $item_detect/announce.items bingo.tmp matches 5 if score $item_detect/bingo.diagonal bingo.tmp matches 2 run tellraw @a {"translate":"bingo.got_sniper_bingo.diag.bottom_left", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}]}
execute if score $item_detect/announce.items bingo.tmp matches 5 if score $item_detect/bingo.diagonal bingo.tmp matches 3 run tellraw @a {"translate":"bingo.got_sniper_bingo.double.diags", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}]}

execute as @a[tag=bingo.in_current_team] at @s run function bingo:item_detection/helper/goals/completed_goal_effects

data modify storage bingo:card teams[-1].hasBingo set value true