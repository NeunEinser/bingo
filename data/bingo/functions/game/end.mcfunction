#> bingo:game/end
#
# Ends the game
#
# @internal

scoreboard players set $game_state bingo.state 0
scoreboard players reset $spawn_x bingo.state
scoreboard players reset $spawn_z bingo.state

execute as @a[predicate=bingo:is_in_game] run function bingo:util/go_to_lobby

kill @e[type=minecraft:area_effect_cloud, tag=bingo.spawn, limit=1]
kill @e[type=minecraft:area_effect_cloud, tag=bingo.skybox_cloud, limit=1]
scoreboard players set $pregen_status bingo.state 0
execute in bingo:multi_noise run forceload remove all
execute in bingo:lobby run function neun_einser.timer:stop