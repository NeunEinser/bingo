#> bingo:game/start/spawn_skybox
#
# Spawns all players at the current position
# @within function bingo:game/start/move_z/f

forceload add ~ ~ ~ ~
setblock ~ 127 ~ minecraft:barrier
execute if block ~ 62 ~ minecraft:water run setblock ~ 62 ~ minecraft:dirt
execute if block ~ 62 ~ minecraft:lava run setblock ~ 62 ~ minecraft:dirt
forceload remove ~ ~ ~ ~

execute in bingo:multi_noise run teleport @a ~ 128 ~
effect give @a minecraft:slowness 1000000 6 true
effect give @a minecraft:jump_boost 1000000 128 true
effect give @a minecraft:invisibility 1000000 0 true
effect give @a minecraft:mining_fatigue 1000000 255 true
clear @a

schedule function bingo:game/start/initialize_spawn_sequence 40s