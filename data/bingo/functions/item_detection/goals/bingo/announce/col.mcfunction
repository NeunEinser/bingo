#> bingo:item_detection/goals/bingo/announce/col
#
# Announces reaching a bingo in one column
#
# @within function bingo:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

execute unless score $item_detect/announce.items bingo.tmp matches 5 run tellraw @a {"translate":"bingo.got_bingo.col", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$item_detect/bingo.column", "objective": "bingo.tmp"}}]}
execute if score $item_detect/announce.items bingo.tmp matches 5 run tellraw @a {"translate":"bingo.got_sniper_bingo.col", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$item_detect/bingo.column", "objective": "bingo.tmp"}}]}

execute as @a[tag=bingo.in_current_team] at @s run function bingo:item_detection/goals/completed_goal_effects

data modify storage bingo:card teams[-1].hasBingo set value true