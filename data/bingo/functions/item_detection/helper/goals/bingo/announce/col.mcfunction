#> bingo:item_detection/helper/goals/bingo/announce/col
#
# Announces reaching a bingo in one column
#
# @within function bingo:item_detection/helper/goals/bingo/detect_bingo_and_20_no_bingo

tellraw @a {"translate":"bingo.got_bingo.col", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$item_detect/bingo.column", "objective": "bingo.tmp"}}]}

execute as @a[tag=bingo.in_current_team] at @s run function bingo:item_detection/helper/goals/completed_goal_effects

data modify storage bingo:card teams[-1].hasBingo set value true