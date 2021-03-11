#> bingo:item_detection/helper/goals/bingo/announce/row
#
# Announces reaching a bingo in one row
#
# @within function bingo:item_detection/helper/goals/bingo/detect_bingo_and_20_no_bingo

tellraw @a {"translate":"bingo.got_bingo.row", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$item_detect/bingo.row", "objective": "bingo.tmp"}}]}

execute as @a[tag=bingo.in_current_team] at @s run function bingo:item_detection/helper/goals/completed_goal_effects

data modify storage bingo:card teams[-1].hasBingo set value true