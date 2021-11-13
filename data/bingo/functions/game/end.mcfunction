#> bingo:game/end
#
# Ends the game
#
# @internal

scoreboard players reset * bingo.lobby
scoreboard players set $game_state bingo.state 0
scoreboard players reset $spawn_x bingo.state
scoreboard players reset $spawn_z bingo.state

execute as @a[predicate=bingo:is_in_game] run function bingo:util/go_to_lobby

kill @e[type=minecraft:area_effect_cloud, tag=bingo.spawn, limit=1]
kill @e[type=minecraft:area_effect_cloud, tag=bingo.skybox_cloud, limit=1]
scoreboard players set $pregen_status bingo.state 0
execute in bingo:multi_noise run forceload remove all
execute in bingo:lobby run function neun_einser.timer:stop

execute as @e[type=minecraft:item_frame, tag=bingo.card_frame] at @s run setblock ~ ~ ~-1 minecraft:barrier
execute in bingo:lobby run data modify block 5 3 5 auto set value false