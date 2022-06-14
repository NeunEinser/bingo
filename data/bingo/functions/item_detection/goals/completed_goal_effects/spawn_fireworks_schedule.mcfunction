#> bingo:item_detection/goals/completed_goal_effects/spawn_fireworks_schedule
#
# Plays second part of the completed goal effect
#
# @within
# 	function bingo:item_detection/goals/completed_goal_effects/init
# 	function bingo:item_detection/goals/completed_goal_effects/spawn_fireworks_schedule

execute as @a[predicate=bingo:is_in_game, scores={bingo.fireworks=1..}] at @s run function bingo:item_detection/goals/completed_goal_effects/spawn_fireworks

execute as @e[tag=bingo.fireworks] at @s unless entity @a[distance=..5] run function bingo:item_detection/goals/completed_goal_effects/check_firewroks

execute if entity @e[tag=bingo.fireworks] run schedule function bingo:item_detection/goals/completed_goal_effects/spawn_fireworks_schedule 1t
execute if entity @a[scores={bingo.fireworks=1..40}] run schedule function bingo:item_detection/goals/completed_goal_effects/spawn_fireworks_schedule 1t

execute unless entity @a[scores={bingo.fireworks=1..40}] unless entity @e[tag=bingo.fireworks] run scoreboard players reset @a bingo.fireworks
execute unless entity @a[scores={bingo.fireworks=1..40}] unless entity @e[tag=bingo.fireworks] run scoreboard players reset @e[tag=bingo.fireworks] bingo.prev_y_pos