#> bingo:game/start/initialize_spawn_sequence
#
# Starts the spawn sequence
#
# @within function bingo:game/start/spawn_skybox

execute at @a[limit=1] run setblock ~ ~-1 ~ minecraft:air
effect give @a minecraft:resistance 1000000 255 true

#>
# The countdown timer
# @within function bingo:game/start/**
#declare score_holder $start_game.countdown
scoreboard players set $start_game.countdown bingo.tmp 3

schedule function bingo:game/start/countdown 3s