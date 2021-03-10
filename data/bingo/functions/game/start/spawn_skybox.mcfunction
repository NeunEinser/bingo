#> bingo:game/start/spawn_skybox
#
# Spawns all players at the current position
# @within function bingo:game/start/move_z/f

tellraw @a "Pre-generating Spawnpoint..."
forceload add ~-20 ~-20 ~20 ~20
setblock ~ 127 ~ minecraft:barrier
execute if block ~ 62 ~ minecraft:water run setblock ~ 62 ~ minecraft:dirt
execute if block ~ 62 ~ minecraft:lava run setblock ~ 62 ~ minecraft:dirt

tellraw @a "Loading terrain"
teleport @a ~ 128 ~
effect give @a minecraft:slowness 1000000 6 true
effect give @a minecraft:jump_boost 1000000 128 true
effect give @a minecraft:invisibility 1000000 0 true
effect give @a minecraft:mining_fatigue 1000000 255 true
effect give @a minecraft:saturation 1000000 255 true
clear @a

schedule function bingo:game/start/end_of_skybox 30s