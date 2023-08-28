#> fetchr:item_detection/goals/completed_goal_effects/check_firewroks
#
# Checks if this firework is eligible for ignition and ignites it.
# Condition is LifeTime reached its end, or it's stuck below a block
#
# @within function fetchr:item_detection/goals/completed_goal_effects/spawn_fireworks_schedule
# @context
# 	entity Firework for which to check
# 	position @s

#>
# @private
#declare score_holder $goal_effects/fireworks.life_time
execute store result score $goal_effects/fireworks.life_time fetchr.tmp run data get entity @s LifeTime
#>
# @private
#declare score_holder $goal_effects/fireworks.life
execute store result score $goal_effects/fireworks.life fetchr.tmp run data get entity @s Life
#>
# @private
#declare score_holder $goal_effects/fireworks.y
execute store result score $goal_effects/fireworks.y fetchr.tmp run data get entity @s Pos[1] 4194304

execute if score $goal_effects/fireworks.life fetchr.tmp = $goal_effects/fireworks.life_time fetchr.tmp run data modify entity @s FireworksItem.tag.Fireworks.Explosions set from entity @s FireworksItem.tag.__custom__.fetchr.explosions
execute if score $goal_effects/fireworks.y fetchr.tmp = @s fetchr.prev_y_pos run data modify entity @s FireworksItem.tag.Fireworks.Explosions set from entity @s FireworksItem.tag.__custom__.fetchr.explosions

scoreboard players operation @s fetchr.prev_y_pos = $goal_effects/fireworks.y fetchr.tmp
execute if data entity @s FireworksItem.tag.Fireworks.Explosions[0] run scoreboard players reset @s fetchr.prev_y_pos