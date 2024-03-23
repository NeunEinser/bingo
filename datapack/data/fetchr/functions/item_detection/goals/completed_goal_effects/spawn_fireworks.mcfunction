#> fetchr:item_detection/goals/completed_goal_effects/spawn_fireworks
#
# Spawns fireworks and spreads them around the player
#
# @within function fetchr:item_detection/goals/completed_goal_effects/spawn_fireworks_schedule
# @context
# 	entity Player for whom to play the effects
# 	position @s

#>
# @within
# 	function fetchr:item_detection/goals/completed_goal_effects/spawn_fireworks
# 	function fetchr:item_detection/goals/completed_goal_effects/spawn_fireworks_schedule
#declare tag fetchr.completed_goal_effect_state
#>
# @private
#declare tag fetchr.new_firework
#>
# @private
#declare tag fetchr.spawned_by_player
#>
# @private
#declare tag fetchr.active_player
tag @s add fetchr.active_player

tag @e[tag=fetchr.new_firework, distance=..0.1] add fetchr.spawned_by_player
spreadplayers ~ ~ 0 5 false @e[tag=fetchr.spawned_by_player]
execute as @e[tag=fetchr.spawned_by_player] run data modify entity @s Pos[1] set from entity @a[tag=fetchr.spawned_by_player, distance=..0.1, limit=1] Pos[1]

tag @e[tag=fetchr.spawned_by_player] remove fetchr.new_firework
tag @e[tag=fetchr.spawned_by_player] remove fetchr.spawned_by_player

#NEUN_SCRIPT until 33
#execute if score @s fetchr.completed_goal_effect_state matches 5 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 30, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {fetchr: {explosions: [{Type: 1b, Flicker: false, Trail: false, Colors: [I;16713728], FadeColors: [I;16713728]}, {Type: 0b, Flicker: false, Trail: false, Colors: [I;8302899], FadeColors: [I;8302899]}]}}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

#execute if score @s fetchr.completed_goal_effect_state matches 5 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 20, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {fetchr: {explosions: [{Type: 2b, Flicker: false, Trail: false, Colors: [I;16750848], FadeColors: [I;16750848]}]}}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

#execute if score @s fetchr.completed_goal_effect_state matches 8 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 23, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {fetchr: {explosions: [{Type: 2b, Flicker: false, Trail: false, Colors: [I;1279], FadeColors: [I;1279]}]}}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

#execute if score @s fetchr.completed_goal_effect_state matches 11 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 23, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {fetchr: {explosions: [{Type: 1b, Flicker: false, Trail: true, Colors: [I;13704576], FadeColors: [I;16753828]}, {Type: 0b, Flicker: false, Trail: true, Colors: [I;16756224], FadeColors: [I;11381504]}]}}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

#execute if score @s fetchr.completed_goal_effect_state matches 15 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 34, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {fetchr: {explosions: [{Type: 3b, Flicker: false, Trail: false, Colors: [I;2883328], FadeColors: [I;65408]}]}}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

#execute if score @s fetchr.completed_goal_effect_state matches 18 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 37, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {fetchr: {explosions: [{Type: 4b, Flicker: true, Trail: true, Colors: [I;16711680], FadeColors: [I;16756224]}]}}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

#execute if score @s fetchr.completed_goal_effect_state matches 22 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 32, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {fetchr: {explosions: [{Type: 2b, Flicker: false, Trail: false, Colors: [I;65535], FadeColors: [I;224612]}]}}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

#execute if score @s fetchr.completed_goal_effect_state matches 26 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 38, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {fetchr: {explosions: [{Type: 2b, Flicker: false, Trail: false, Colors: [I;10027263], FadeColors:[I;14256383]}]}}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

#execute if score @s fetchr.completed_goal_effect_state matches 30 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 35, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {fetchr: {explosions: [{Type: 2b, Flicker: false, Trail: false, Colors: [I;16776895], FadeColors: [I;16759552]}]}}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

#execute if score @s fetchr.completed_goal_effect_state matches 33 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 38, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {fetchr: {explosions: [{Type: 3b, Flicker: false, Trail: false, Colors: [I;2883328], FadeColors: [I;65408]}]}}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

#execute if score @s fetchr.completed_goal_effect_state matches 37 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 32, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {fetchr: {explosions: [{Type: 2b, Flicker: false, Trail: false, Colors: [I;16743168], FadeColors: [I;5449728]}]}}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}
#NEUN_SCRIPT end
#NEUN_SCRIPT since 33
execute if score @s fetchr.completed_goal_effect_state matches 5 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 30, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, components: {"minecraft:fireworks": { flight_duration: 2b }, 'minecraft:custom_data': { fetchr: [{shape: "large_ball", colors: [I; 16713728], fade_colors: [I; 16713728] }, {shape: "small_ball", colors: [I; 8302899], fade_colors: [I; 8302899] }]}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

execute if score @s fetchr.completed_goal_effect_state matches 5 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 20, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, components: {"minecraft:fireworks": { flight_duration: 2b }, 'minecraft:custom_data': { fetchr: [{shape: "star", colors: [I; 16750848], fade_colors: [I; 16750848] }]}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

execute if score @s fetchr.completed_goal_effect_state matches 8 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 23, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, components: {"minecraft:fireworks": { flight_duration: 2b }, 'minecraft:custom_data': { fetchr: [{shape: "star", colors: [I; 1279], fade_colors: [I; 1279] }]}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

execute if score @s fetchr.completed_goal_effect_state matches 11 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 23, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, components: {"minecraft:fireworks": { flight_duration: 2b }, 'minecraft:custom_data': { fetchr: [{shape: "large_ball", has_trail: true, colors: [I; 13704576], fade_colors: [I; 16753828] }, {shape: "small_ball", has_trail: true, colors: [I; 16756224], fade_colors: [I; 11381504] }]}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

execute if score @s fetchr.completed_goal_effect_state matches 15 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 34, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, components: {"minecraft:fireworks": { flight_duration: 2b }, 'minecraft:custom_data': { fetchr: [{shape: "creeper", colors: [I; 2883328], fade_colors: [I; 65408] }]}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

execute if score @s fetchr.completed_goal_effect_state matches 18 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 37, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, components: {"minecraft:fireworks": { flight_duration: 2b }, 'minecraft:custom_data': { fetchr: [{shape: "burst", has_twinkle: true, has_trail: true, colors: [I; 16711680], fade_colors: [I; 16756224] }]}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

execute if score @s fetchr.completed_goal_effect_state matches 22 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 32, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, components: {"minecraft:fireworks": { flight_duration: 2b }, 'minecraft:custom_data': { fetchr: [{shape: "star", colors: [I; 65535], fade_colors: [I; 224612] }]}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

execute if score @s fetchr.completed_goal_effect_state matches 26 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 38, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, components: {"minecraft:fireworks": { flight_duration: 2b }, 'minecraft:custom_data': { fetchr: [{shape: "star", colors: [I; 10027263], fade_colors: [I; 14256383] }]}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

execute if score @s fetchr.completed_goal_effect_state matches 30 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 35, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, components: {"minecraft:fireworks": { flight_duration: 2b }, 'minecraft:custom_data': { fetchr: [{shape: "star", colors: [I; 16776895], fade_colors: [I; 16759552] }]}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

execute if score @s fetchr.completed_goal_effect_state matches 33 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 38, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, components: {"minecraft:fireworks": { flight_duration: 2b }, 'minecraft:custom_data': { fetchr: [{shape: "creeper", colors: [I; 2883328], fade_colors: [I; 65408] }]}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}

execute if score @s fetchr.completed_goal_effect_state matches 37 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 32, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, components: {"minecraft:fireworks": { flight_duration: 2b }, 'minecraft:custom_data': { fetchr: [{shape: "star", colors: [I; 16743168], fade_colors: [I; 5449728] }]}}}, Tags: ["fetchr.new_firework", "fetchr.completed_goal_effect_state"]}
#NEUN_SCRIPT end

scoreboard players add @s[scores={fetchr.completed_goal_effect_state=1..}] fetchr.completed_goal_effect_state 1
tag @s remove fetchr.active_player
