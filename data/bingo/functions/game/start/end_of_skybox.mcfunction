#> bingo:game/start/end_of_skybox
#
# Starts the spawn sequence
#
# @within function bingo:game/start/spawn_skybox

execute in bingo:multi_noise run forceload remove all

execute in bingo:multi_noise at @a[distance=0.., limit=1] run setblock ~ ~-1 ~ minecraft:air
effect give @a minecraft:resistance 1000000 255 true

#>
# The countdown timer
# @within function bingo:game/start/**
#declare score_holder $start_game.countdown
scoreboard players set $start_game.countdown bingo.tmp 3

schedule function bingo:game/start/countdown 3s
tellraw @a "[DEBUG] Scheduled function"