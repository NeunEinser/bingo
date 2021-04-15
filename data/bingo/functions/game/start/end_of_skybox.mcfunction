#> bingo:game/start/end_of_skybox
#
# Starts the spawn sequence
#
# @within function bingo:game/start/spawn_skybox

#>
# @private
#declare score_holder $end_of_skybox

scoreboard players set $end_of_skybox bingo.debug_scdl 0

execute in bingo:multi_noise run forceload remove all

execute in bingo:multi_noise at @a[distance=0.., limit=1] run setblock ~ ~-1 ~ minecraft:air
effect give @a minecraft:resistance 1000000 255 true

#>
# The countdown timer
# @within function bingo:game/start/**
#declare score_holder $start_game.countdown
scoreboard players set $start_game.countdown bingo.schedule 3

schedule function bingo:game/start/countdown 3s

scoreboard players set $end_of_skybox bingo.debug_scdl 1