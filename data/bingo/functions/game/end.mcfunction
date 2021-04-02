#> bingo:game/end
#
# Ends the game
#
# @internal

scoreboard players set $game_in_progress bingo.state 0
execute as @a[predicate=!bingo:is_in_lobby] in bingo:lobby run teleport @s 0 64 0
kill @e[type=minecraft:area_effect_cloud, tag=bingo.spawn, limit=1]
execute in bingo:multi_noise run forceload remove all
execute in bingo:lobby run function neun_einser.timer:pause