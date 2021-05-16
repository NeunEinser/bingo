#> bingo:game/end
#
# Ends the game
#
# @internal

scoreboard players set $game_state bingo.state 0
execute in bingo:lobby run teleport @a[predicate=!bingo:is_in_lobby] -8.5 3 7.5 180 0
execute in bingo:lobby run spawnpoint @a -9 3 7
kill @e[type=minecraft:area_effect_cloud, tag=bingo.spawn, limit=1]
kill @e[type=minecraft:area_effect_cloud, tag=bingo.skybox_cloud, limit=1]
scoreboard players set $pregen_status bingo.state 0
execute in bingo:multi_noise run forceload remove all
execute in bingo:lobby run function neun_einser.timer:pause