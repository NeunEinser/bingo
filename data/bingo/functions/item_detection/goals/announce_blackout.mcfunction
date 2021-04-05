#> bingo:item_detection/goals/announce_blackout
#
# Announces a blackout and plays the goal completed effect for the entire team
#
# @within function bingo:item_detection/announce

tellraw @a {"translate": "bingo.got_blackout", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}]}
execute as @a[tag=bingo.in_current_team] at @s run function bingo:item_detection/goals/completed_goal_effects