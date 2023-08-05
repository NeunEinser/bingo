#> fetchr:item_detection/goals/completed_goal_effects/init
#
# Plays the goal completed effect for @s
#
# @within function fetchr:item_detection/goals/**
# @context
# 	entity Player for whom to play the effects
# 	position @s

playsound minecraft:entity.player.levelup voice @s ~ ~ ~ 1 0.95
scoreboard players set @s fetchr.completed_goal_effect_state 1

schedule function fetchr:item_detection/goals/completed_goal_effects/spawn_fireworks_schedule 1t