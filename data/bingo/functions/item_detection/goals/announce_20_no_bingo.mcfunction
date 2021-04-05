#> bingo:item_detection/goals/announce_20_no_bingo
#
# Announces a 20 no bingo and plays the goal completed effect for the entire
# team
#
# @within function bingo:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

tellraw @a {"translate": "bingo.got_20_no_bingo", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}]}
execute as @a[tag=bingo.in_current_team] at @s run function bingo:item_detection/goals/completed_goal_effects