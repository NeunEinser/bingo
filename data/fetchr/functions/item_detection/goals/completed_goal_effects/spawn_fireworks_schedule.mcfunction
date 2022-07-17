#> fetchr:item_detection/goals/completed_goal_effects/spawn_fireworks_schedule
#
# Plays second part of the completed goal effect
#
# @within
# 	function fetchr:item_detection/goals/completed_goal_effects/init
# 	function fetchr:item_detection/goals/completed_goal_effects/spawn_fireworks_schedule

execute as @a[predicate=fetchr:is_in_game, scores={fetchr.completed_goal_effect_state=1..}] at @s run function fetchr:item_detection/goals/completed_goal_effects/spawn_fireworks

execute as @e[tag=fetchr.completed_goal_effect_state] at @s unless entity @a[distance=..5] run function fetchr:item_detection/goals/completed_goal_effects/check_firewroks

execute if entity @e[tag=fetchr.completed_goal_effect_state] run schedule function fetchr:item_detection/goals/completed_goal_effects/spawn_fireworks_schedule 1t
execute if entity @a[scores={fetchr.completed_goal_effect_state=1..40}] run schedule function fetchr:item_detection/goals/completed_goal_effects/spawn_fireworks_schedule 1t

execute unless entity @a[scores={fetchr.completed_goal_effect_state=1..40}] unless entity @e[tag=fetchr.completed_goal_effect_state] run scoreboard players reset @a fetchr.completed_goal_effect_state
execute unless entity @a[scores={fetchr.completed_goal_effect_state=1..40}] unless entity @e[tag=fetchr.completed_goal_effect_state] run scoreboard players reset @e[tag=fetchr.completed_goal_effect_state] fetchr.prev_y_pos