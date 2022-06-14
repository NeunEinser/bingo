#> bingo:item_detection/goals/completed_goal_effects/init
#
# Plays the goal completed effect for @s
#
# @within function bingo:item_detection/goals/**
# @context
# 	entity Player for whom to play the effects
# 	position @s

execute as @a[tag=bingo.in_current_team] at @s run playsound minecraft:entity.player.levelup voice @s ~ ~ ~ 1 0.95
scoreboard players set @a[tag=bingo.in_current_team] bingo.fireworks 1

schedule function bingo:item_detection/goals/completed_goal_effects/spawn_fireworks_schedule 1t

execute as @a run function bingo:game/bingo_menu/print_without_hint
