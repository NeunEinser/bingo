#> fetchr:game/end
#
# Ends the game
#
# @internal

scoreboard players reset * fetchr.lobby
scoreboard players set $game_state fetchr.state 0
scoreboard players reset $spawn_x fetchr.state
scoreboard players reset $spawn_z fetchr.state

execute as @a[predicate=fetchr:is_in_game] run function fetchr:util/go_to_lobby

kill @e[type=minecraft:marker, tag=fetchr.spawn, limit=1]
kill @e[type=minecraft:marker, tag=fetchr.skybox, limit=1]
scoreboard players set $pregen_status fetchr.state 0
execute in fetchr:default run forceload remove all
execute in fetchr:lobby run function neun_einser.timer:stop

execute as @e[type=minecraft:item_frame, tag=fetchr.card_frame] at @s run setblock ~ ~ ~-1 minecraft:barrier
execute in fetchr:lobby run data modify block 5 3 5 auto set value false