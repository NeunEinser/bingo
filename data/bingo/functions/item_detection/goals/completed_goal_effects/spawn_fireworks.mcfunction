#> bingo:item_detection/goals/completed_goal_effects/spawn_fireworks
#
# Spawns fireworks and spreads them around the player
#
# @within function bingo:item_detection/goals/completed_goal_effects/spawn_fireworks_schedule
# @context
# 	entity Player for whom to play the effects
# 	position @s

#>
# @within
# 	function bingo:item_detection/goals/completed_goal_effects/spawn_fireworks
# 	function bingo:item_detection/goals/completed_goal_effects/spawn_fireworks_schedule
#declare tag bingo.fireworks
#>
# @private
#declare tag bingo.new_firework
#>
# @private
#declare tag bingo.spawned_by_player
#>
# @private
#declare tag bingo.active_player
tag @s add bingo.active_player

tag @e[tag=bingo.new_firework, distance=..0.1] add bingo.spawned_by_player
spreadplayers ~ ~ 0 5 false @e[tag=bingo.spawned_by_player]
execute as @e[tag=bingo.spawned_by_player] run data modify entity @s Pos[1] set from entity @a[tag=bingo.active_player, distance=..0.1, limit=1] Pos[1]

tag @e[tag=bingo.spawned_by_player] remove bingo.new_firework
tag @e[tag=bingo.spawned_by_player] remove bingo.spawned_by_player

execute if score @s bingo.fireworks matches 5 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 30, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {bingo: {explosions: [{Type: 1b, Flicker: false, Trail: false, Colors: [I;16713728], FadeColors: [I;16713728]}, {Type: 0b, Flicker: false, Trail: false, Colors: [I;8302899], FadeColors: [I;8302899]}]}}}}, Tags: ["bingo.new_firework", "bingo.fireworks"]}

execute if score @s bingo.fireworks matches 5 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 20, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {bingo: {explosions: [{Type: 2b, Flicker: false, Trail: false, Colors: [I;16750848], FadeColors: [I;16750848]}]}}}}, Tags: ["bingo.new_firework", "bingo.fireworks"]}

execute if score @s bingo.fireworks matches 8 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 23, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {bingo: {explosions: [{Type: 2b, Flicker: false, Trail: false, Colors: [I;1279], FadeColors: [I;1279]}]}}}}, Tags: ["bingo.new_firework", "bingo.fireworks"]}

execute if score @s bingo.fireworks matches 11 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 23, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {bingo: {explosions: [{Type: 1b, Flicker: false, Trail: true, Colors: [I;13704576], FadeColors: [I;16753828]}, {Type: 0b, Flicker: false, Trail: true, Colors: [I;16756224], FadeColors: [I;11381504]}]}}}}, Tags: ["bingo.new_firework", "bingo.fireworks"]}

execute if score @s bingo.fireworks matches 15 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 34, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {bingo: {explosions: [{Type: 3b, Flicker: false, Trail: false, Colors: [I;2883328], FadeColors: [I;65408]}]}}}}, Tags: ["bingo.new_firework", "bingo.fireworks"]}

execute if score @s bingo.fireworks matches 18 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 37, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {bingo: {explosions: [{Type: 4b, Flicker: true, Trail: true, Colors: [I;16711680], FadeColors: [I;16756224]}]}}}}, Tags: ["bingo.new_firework", "bingo.fireworks"]}

execute if score @s bingo.fireworks matches 22 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 32, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {bingo: {explosions: [{Type: 2b, Flicker: false, Trail: false, Colors: [I;65535], FadeColors: [I;224612]}]}}}}, Tags: ["bingo.new_firework", "bingo.fireworks"]}

execute if score @s bingo.fireworks matches 26 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 38, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {bingo: {explosions: [{Type: 2b, Flicker: false, Trail: false, Colors: [I;10027263], FadeColors:[I;14256383]}]}}}}, Tags: ["bingo.new_firework", "bingo.fireworks"]}

execute if score @s bingo.fireworks matches 30 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 35, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {bingo: {explosions: [{Type: 2b, Flicker: false, Trail: false, Colors: [I;16776895], FadeColors: [I;16759552]}]}}}}, Tags: ["bingo.new_firework", "bingo.fireworks"]}

execute if score @s bingo.fireworks matches 33 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 38, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {bingo: {explosions: [{Type: 3b, Flicker: false, Trail: false, Colors: [I;2883328], FadeColors: [I;65408]}]}}}}, Tags: ["bingo.new_firework", "bingo.fireworks"]}

execute if score @s bingo.fireworks matches 37 run summon minecraft:firework_rocket ~ ~ ~ {LifeTime: 32, FireworksItem: {id: "minecraft:firework_rocket", Count: 1b, tag: {Fireworks: {Flight: 2b}, __custom__: {bingo: {explosions: [{Type: 2b, Flicker: false, Trail: false, Colors: [I;16743168], FadeColors: [I;5449728]}]}}}}, Tags: ["bingo.new_firework", "bingo.fireworks"]}

scoreboard players add @s[scores={bingo.fireworks=1..}] bingo.fireworks 1
tag @s remove bingo.active_player